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

module "irsa_efs_csi_driver" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.47.1"

  for_each = var.enable_irsa ? toset(["1"]) : toset([])

  role_name             = var.efs_csi_controller_role_name
  attach_efs_csi_policy = true

  oidc_providers = {
    main = {
      provider_arn = module.eks.oidc_provider_arn
      namespace_service_accounts = [
        "${var.efs_csi_controller_namespace}:${var.efs_csi_controller_sa_name}",
      ]
    }
  }

  tags = merge(
    { "Name" = var.efs_csi_controller_role_name },
    var.cluster_tags,
    var.efs_csi_driver_tags,
    var.tags
  )
}

module "pod_identity_efs_csi_driver" {
  source  = "terraform-aws-modules/eks-pod-identity/aws"
  version = "1.7.0"

  for_each = var.enable_pod_identity ? toset(["1"]) : toset([])

  name = var.efs_csi_controller_role_name

  associations = {
    main = {
      cluster_name    = data.aws_eks_cluster.this.id
      namespace       = var.efs_csi_controller_namespace
      service_account = var.efs_csi_controller_sa_name
    }
  }

  tags = merge(
    { "Name" = var.efs_csi_controller_role_name },
    var.cluster_tags,
    var.efs_csi_driver_tags,
    var.tags
  )
}
