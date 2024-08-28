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

module "irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.42.0"

  for_each = var.enable_irsa ? toset(["1"]) : toset([])

  role_name                    = var.role_name
  attach_fsx_lustre_csi_policy = true

  oidc_providers = {
    main = {
      provider_arn = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
      namespace_service_accounts = [
        "${var.namespace}:${var.service_account}",
      ]
    }
  }

  tags = var.tags
}

module "pod_identity" {
  source  = "terraform-aws-modules/eks-pod-identity/aws"
  version = "1.4.0"

  for_each = var.enable_pod_identity ? toset(["1"]) : toset([])

  name = var.role_name

  associations = {
    main = {
      cluster_name    = data.aws_eks_cluster.this.id
      namespace       = var.namespace
      service_account = var.service_account
    }
  }

  tags = var.tags
}
