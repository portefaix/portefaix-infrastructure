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
  version = "21.1.5"

  cluster_name = module.eks.cluster_name

  iam_role_name      = var.karpenter_role_name
  node_iam_role_name = format("%s-node", var.karpenter_role_name)
  # iam_policy_name    = "KarpenterIRSA-${module.eks.cluster_name}"

  # https://github.com/terraform-aws-modules/terraform-aws-eks/issues/3477
  # enable_irsa                     = var.enable_irsa
  # irsa_namespace_service_accounts = ["${var.karpenter_namespace}:${var.karpenter_sa_name}"]
  # irsa_oidc_provider_arn          = module.eks.oidc_provider_arn

  enable_spot_termination = true
  # enable_pod_identity             = var.enable_pod_identity
  create_pod_identity_association = var.enable_pod_identity

  namespace       = var.karpenter_namespace
  service_account = var.karpenter_sa_name

  node_iam_role_additional_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  iam_role_source_assume_policy_documents = [
    data.aws_iam_policy_document.karpenter_controller_assume_role_policy.json,
  ]

  queue_name                = var.karpenter_queue_name
  queue_managed_sse_enabled = false

  tags = merge(
    { "Name" = var.karpenter_role_name },
    var.cluster_tags,
    var.karpenter_tags,
    var.tags
  )
}
