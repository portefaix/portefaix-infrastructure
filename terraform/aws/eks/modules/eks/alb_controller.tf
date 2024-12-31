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

module "irsa_alb_controller" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.48.0"

  for_each = var.enable_irsa ? toset(["1"]) : toset([])

  role_name                              = var.alb_controller_role_name
  attach_load_balancer_controller_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["${var.alb_controller_namespace}:${var.alb_controller_sa_name}"]
    }
  }

  tags = merge(
    { "Name" = var.alb_controller_role_name },
    var.cluster_tags,
    var.alb_controller_tags,
    var.tags
  )
}

module "pod_identity_alb_controller" {
  source  = "terraform-aws-modules/eks-pod-identity/aws"
  version = "1.9.0"

  for_each = var.enable_pod_identity ? toset(["1"]) : toset([])

  name = var.alb_controller_role_name

  associations = {
    main = {
      cluster_name    = data.aws_eks_cluster.this.id
      namespace       = var.alb_controller_namespace
      service_account = var.alb_controller_sa_name
    }
  }

  tags = merge(
    { "Name" = var.alb_controller_role_name },
    var.cluster_tags,
    var.alb_controller_tags,
    var.tags
  )
}
