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

#tfsec:ignore:aws-eks-no-public-cluster-access
#tfsec:ignore:aws-eks-no-public-cluster-access-to-cidr
#tfsec:ignore:aws-eks-encrypt-secrets
#tfsec:ignore:aws-eks-enable-control-plane-logging
#tfsec:ignore:aws-ec2-no-public-egress-sgr
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.28.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = data.aws_vpc.main.id
  subnet_ids = data.aws_subnets.private.ids

  enable_irsa              = true
  openid_connect_audiences = ["sts.amazonaws.com"]

  iam_role_name = var.cluster_name

  enable_cluster_creator_admin_permissions = true

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true
  cluster_security_group_name     = var.cluster_name
  cluster_security_group_tags = {
    format("karpenter.sh/discovery/%s", var.cluster_name) = var.cluster_name
  }
  cluster_enabled_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]
  cluster_addons = var.cluster_addons

  node_security_group_tags = {
    format("karpenter.sh/discovery/%s", var.cluster_name) = var.cluster_name
  }

  eks_managed_node_groups = var.eks_managed_node_groups
  eks_managed_node_group_defaults = {
    iam_role_additional_policies = {
      AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
      CloudWatchAgentServerPolicy  = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
    }
  }

  fargate_profile_defaults = var.fargate_profile_defaults
  fargate_profiles         = var.fargate_profiles

  cluster_tags = merge(var.cluster_tags, var.tags)
  tags         = var.tags
}
