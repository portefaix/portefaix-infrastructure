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

module "irsa_appmesh" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.60.0"

  role_name                        = var.appmesh_controller_role_name
  attach_appmesh_controller_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["${var.appmesh_namespace}:${var.appmesh_sa_name}"]
    }
  }

  tags = merge(
    { "Name" = var.appmesh_controller_role_name },
    var.cluster_tags,
    var.appmesh_tags,
    var.tags
  )
}

module "pod_identity_appmesh" {
  source  = "terraform-aws-modules/eks-pod-identity/aws"
  version = "2.0.0"

  for_each = var.enable_pod_identity ? toset(["1"]) : toset([])

  name = var.appmesh_controller_role_name

  associations = {
    main = {
      cluster_name    = module.eks.cluster_name
      namespace       = var.appmesh_namespace
      service_account = var.appmesh_sa_name
    }
  }

  tags = merge(
    { "Name" = var.appmesh_controller_role_name },
    var.cluster_tags,
    var.appmesh_tags,
    var.tags
  )
}
