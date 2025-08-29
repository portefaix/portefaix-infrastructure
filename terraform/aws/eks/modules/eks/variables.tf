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

#############################################################################
# Provider

# variable "region" {
#   type        = string
#   description = "AWS Region"
# }

# variable "default_tags" {
#   type        = map(string)
#   description = "Tags for the AWS provider"
#   default = {
#     "Project" = "portefaix"
#     "Made-By" = "terraform"
#   }
# }

#############################################################################
# Networking

variable "vpc_name" {
  type        = string
  description = "ID of the VPC"
}

#############################################################################
# Kubernetes cluster


variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "The EKS Kubernetes version"
}

variable "tags" {
  description = "A map of tags to add to all resources. Tags added to launch configuration or templates override these values for ASG Tags only."
  type        = map(string)
  default = {
    "made-by" = "terraform"
  }
}

variable "cluster_tags" {
  description = "A map of tags to add to just the eks resource."
  type        = map(string)
  default = {
    "made-by" = "terraform"
  }
}

variable "cluster_addons" {
  description = "Map of cluster addon configurations to enable for the cluster. Addon name can be the map keys or set with `name`"
  type        = any
  default     = {}
}

variable "enable_irsa" {
  type        = bool
  description = "Enable IRSA resources"
}

variable "enable_pod_identity" {
  type        = bool
  description = "Enable EKS Pod Identity resources"
}

#############################################################################
# Fargate

variable "fargate_profile_name" {
  description = "The name of the Fargate profile"
  type        = string
  default     = "fargate"
}

variable "fargate_selectors" {
  description = "List of fargate selectors"
  type        = list(map(string))
  default = [
    {
      namespace = "karpenter"
    }
  ]
}

variable "fargate_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

#############################################################################
# EBS CSI Driver

variable "ebs_csi_controller_role_name" {
  description = "The name of the EBS CSI driver IAM role"
  type        = string
  default     = "ebs-csi-driver-controller"
}

variable "ebs_csi_driver_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "ebs_csi_controller_sa_name" {
  description = "Controller name"
  type        = string
  default     = "ebs-csi-controller"
}

variable "ebs_csi_controller_namespace" {
  description = "The K8s namespace for all EBS CSI driver resources"
  type        = string
  default     = "kube-system"
}

#############################################################################
# EFS CSI Driver

variable "efs_csi_controller_role_name" {
  description = "The name of the EFS CSI driver IAM role"
  type        = string
  default     = "efs-csi-driver-controller"
}

variable "efs_csi_driver_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "efs_csi_controller_sa_name" {
  description = "Controller name"
  type        = string
  default     = "efs-csi-controller"
}

variable "efs_csi_controller_namespace" {
  description = "The K8s namespace for all EFS CSI driver resources"
  type        = string
  default     = "kube-system"
}

#############################################################################
# FSX CSI Driver

variable "fsx_csi_controller_role_name" {
  description = "The name of the FSX CSI driver IAM role"
  type        = string
  default     = "fsx-csi-driver-controller"
}

variable "fsx_csi_driver_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "fsx_csi_controller_sa_name" {
  description = "Controller name"
  type        = string
  default     = "fsx-csi-controller"
}

variable "fsx_csi_controller_namespace" {
  description = "The K8s namespace for all FSX CSI driver resources"
  type        = string
  default     = "kube-system"
}

#############################################################################
# Secret Store CSI Driver

#tfsec:ignore:GEN001
variable "secret_store_csi_controller_role_name" {
  description = "The name of the Secret Store CSI driver IAM role"
  type        = string
  default     = "secret-store-csi-driver-controller"
}

#tfsec:ignore:GEN001
variable "secret_store_csi_controller_role_policy_name" {
  description = "The prefix of the Secret Store CSI driver IAM policy"
  default     = "AmazonEKS_SecretStore_CSI_Driver_Policy"
  type        = string
}

variable "secret_store_csi_driver_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "secrets_data" {
  description = "Secret Store CSI Driver data"
  type = list(object({
    name      = string
    prefix    = string
    namespace = string
    sa_name   = string
  }))
  default = []
}


#############################################################################
# AWS ALB Controller

variable "alb_controller_role_name" {
  description = "The name of the EBS CSI driver IAM role"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "alb_controller_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "alb_controller_sa_name" {
  description = "Controller name"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "alb_controller_namespace" {
  description = "The K8s namespace for ALB Controller resources"
  type        = string
  default     = "kube-system"
}

#############################################################################
# Node Terminaison Handler

variable "node_termination_handler_role_name" {
  description = "The name of the AppMesh Controller IAM role"
  type        = string
  default     = "node-terminaison-handler"
}

variable "node_termination_handler_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "node_termination_handler_sa_name" {
  description = "Controller name"
  type        = string
  default     = "node-terminaison-handler"
}

variable "node_termination_handler_namespace" {
  description = "The K8s namespace for resources"
  type        = string
  default     = "kube-system"
}

#############################################################################
# Karpenter

variable "karpenter_role_name" {
  description = "The name of the AppMesh Controller IAM role"
  type        = string
  default     = "karpenter"
}

variable "karpenter_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "karpenter_sa_name" {
  description = "Controller name"
  type        = string
  default     = "karpenter"
}

variable "karpenter_namespace" {
  description = "The K8s namespace for resources"
  type        = string
  default     = "kube-system"
}

variable "karpenter_queue_name" {
  type        = string
  description = "Name of the SQS queue"
}

#############################################################################
# External Secrets Operator

variable "eso_role_name" {
  description = "The name of the ESO IAM role"
  type        = string
  default     = "eso-controller"
}

variable "eso_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "eso_sa_name" {
  description = "Controller name"
  type        = string
  default     = "eso-controller"
}

variable "eso_namespace" {
  description = "The K8s namespace for all ESO resources"
  type        = string
  default     = "kube-system"
}

variable "eso_secrets_arns" {
  type        = list(string)
  description = "List of Secrets Manager ARNs that contain secrets to mount using External Secrets Operator"
  default     = []
}
