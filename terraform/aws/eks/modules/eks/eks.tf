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
  version = "21.2.0"

  name               = var.cluster_name
  kubernetes_version = var.cluster_version

  # Gives Terraform identity admin access to cluster which will
  # allow deploying resources (Karpenter) into the cluster
  enable_cluster_creator_admin_permissions = true
  endpoint_public_access                   = true
  endpoint_private_access                  = true

  vpc_id     = data.aws_vpc.main.id
  subnet_ids = data.aws_subnets.private.ids

  enable_irsa              = true
  openid_connect_audiences = ["sts.amazonaws.com"]

  iam_role_name = var.cluster_name

  # cluster_security_group_name     = var.cluster_name
  # cluster_security_group_tags = {
  #   format("karpenter.sh/discovery/%s", var.cluster_name) = var.cluster_name
  # }
  # cluster_enabled_log_types = [
  #   "api",
  #   "audit",
  #   "authenticator",
  #   "controllerManager",
  #   "scheduler"
  # ]

  addons = var.cluster_addons

  node_security_group_tags = {
    format("karpenter.sh/discovery/%s", var.cluster_name) = var.cluster_name
  }

  cluster_tags = merge(var.cluster_tags, var.tags)
  tags         = var.tags
}
