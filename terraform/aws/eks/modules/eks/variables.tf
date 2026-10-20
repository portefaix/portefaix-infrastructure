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
# Karpenter

variable "karpenter_role_name" {
  description = "The name of the Karpenter controller IAM role"
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
