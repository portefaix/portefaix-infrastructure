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

#tfsec:ignore:AWS066 tfsec:ignore:AWS068 tfsec:ignore:AWS069
module "eks" {
  source = "../modules/eks"

  vpc_name = var.vpc_name

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  tags         = var.tags
  cluster_tags = var.cluster_tags

  fargate_profile_name = var.cluster_name
  fargate_selectors    = var.fargate_selectors
  fargate_tags         = var.fargate_tags

  cluster_addons = var.cluster_addons

  enable_irsa         = false
  enable_pod_identity = true

  ebs_csi_driver_tags          = var.ebs_csi_driver_tags
  ebs_csi_controller_sa_name   = var.ebs_csi_controller_sa_name
  ebs_csi_controller_namespace = var.ebs_csi_controller_namespace

  efs_csi_driver_tags          = var.efs_csi_driver_tags
  efs_csi_controller_sa_name   = var.efs_csi_controller_sa_name
  efs_csi_controller_namespace = var.efs_csi_controller_namespace

  fsx_csi_driver_tags          = var.fsx_csi_driver_tags
  fsx_csi_controller_sa_name   = var.fsx_csi_controller_sa_name
  fsx_csi_controller_namespace = var.fsx_csi_controller_namespace

  secret_store_csi_driver_tags = var.secret_store_csi_driver_tags
  secrets_data                 = var.secrets_data

  alb_controller_tags      = var.alb_controller_tags
  alb_controller_sa_name   = var.alb_controller_sa_name
  alb_controller_namespace = var.alb_controller_namespace

  node_termination_handler_role_name = var.node_termination_handler_role_name
  node_termination_handler_tags      = var.node_termination_handler_tags
  node_termination_handler_sa_name   = var.node_termination_handler_sa_name
  node_termination_handler_namespace = var.node_termination_handler_namespace

  karpenter_role_name  = var.karpenter_role_name
  karpenter_tags       = var.karpenter_tags
  karpenter_sa_name    = var.karpenter_sa_name
  karpenter_namespace  = var.karpenter_namespace
  karpenter_queue_name = var.karpenter_queue_name

  eso_role_name    = var.eso_role_name
  eso_tags         = var.eso_tags
  eso_sa_name      = var.eso_sa_name
  eso_namespace    = var.eso_namespace
  eso_secrets_arns = var.eso_secrets_arns
}
