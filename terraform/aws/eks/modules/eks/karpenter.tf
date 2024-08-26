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

module "karpenter" {
  source  = "terraform-aws-modules/eks/aws//modules/karpenter"
  version = "20.24.0"

  cluster_name = module.eks.cluster_name

  enable_v1_permissions = true

  iam_role_name      = var.karpenter_role_name
  node_iam_role_name = format("%s-node", var.karpenter_role_name)
  # iam_policy_name    = "KarpenterIRSA-${module.eks.cluster_name}"

  enable_irsa                     = true
  irsa_namespace_service_accounts = ["${var.karpenter_namespace}:${var.karpenter_sa_name}"]
  irsa_oidc_provider_arn          = module.eks.oidc_provider_arn

  node_iam_role_additional_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  queue_name                = var.karpenter_queue_name
  queue_managed_sse_enabled = false

  tags = merge(
    { "Name" = var.karpenter_role_name },
    var.cluster_tags,
    var.karpenter_tags,
    var.tags
  )
}
