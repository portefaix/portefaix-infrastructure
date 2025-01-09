# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

resource "aws_iam_policy" "secret_store_csi_driver_controller" {
  for_each = toset(var.secrets_data)

  name        = format("%s-%s", var.secret_store_csi_controller_role_policy_name, each.value.name)
  description = format("Allow %s with CSI Driver to manage AWS Secret Manager resources", each.value.name)
  path        = "/"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ],
        "Resource" : [
          "arn:*:secretsmanager:*:*:secret:${each.value.prefix}/*"
        ]
      }
    ]
  })
  tags = merge(
    var.cluster_tags,
    var.secret_store_csi_driver_tags,
    var.tags
  )
}

module "irsa_secret_store_csi_driver" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "5.52.2"

  for_each = var.enable_irsa ? toset(var.secrets_data) : toset([])

  create_role      = true
  role_description = "Secret Store CSI Driver Role"
  role_name        = format("%s-%s", var.secret_store_csi_controller_role_name, each.value.name)

  provider_url     = module.eks.cluster_oidc_issuer_url
  role_policy_arns = [aws_iam_policy.secret_store_csi_driver_controller[count.index].arn]

  oidc_fully_qualified_subjects = ["system:serviceaccount:${each.value.namespace}:${each.value.sa_name}"]

  tags = merge(
    var.cluster_tags,
    var.secret_store_csi_driver_tags,
    var.tags
  )
}

module "pod_identity_secret_store_csi_driver" {
  source  = "terraform-aws-modules/eks-pod-identity/aws"
  version = "1.9.0"

  for_each = var.enable_pod_identity ? toset(var.secrets_data) : toset([])

  name = format("%s-%s", var.secret_store_csi_controller_role_name, each.value.name)

  associations = {
    main = {
      cluster_name    = data.aws_eks_cluster.this.id
      namespace       = each.value.namespace
      service_account = each.value.sa_name
    }
  }

  tags = merge(
    { "Name" = format("%s-%s", var.secret_store_csi_controller_role_name, each.value.name) },
    var.cluster_tags,
    var.fsx_csi_driver_tags,
    var.tags
  )
}
