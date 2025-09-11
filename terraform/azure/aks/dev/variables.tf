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

############################################################################
# Provider

variable "subscription_core_dev_id" {
  type        = string
  description = "The Subscription ID for Core Dev resources"
}

#############################################################################
# Networking

variable "aks_subnet_name" {
  type        = string
  description = "Name of the AKS subnet"
}

variable "appgw_subnet_name" {
  type        = string
  description = "Name of the Application Gateway subnet"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the Virtual Network this Subnet is located within"
}

variable "vnet_resource_group_name" {
  type        = string
  description = "The Name which should be used for the networking Resource Group"
}

#############################################################################
# Active Directory

# variable "aad_group_name" {
#   description = "Name of the Azure AD group for cluster-admin access"
#   type        = string
# }

#############################################################################
# Kubernetes cluster

variable "organization" {
  description = "Name of the organization."
  type        = string
}

variable "environment" {
  type        = string
  description = "The name of the environment"
}

variable "resource_group_location" {
  type        = string
  description = "The Azure Region where the Resource Group for AKS should exist."
}

variable "kubernetes_version" {
  type        = string
  description = "The AKS Kubernetes version"
}

variable "authorized_ip_ranges" {
  type        = list(string)
  description = "The IP ranges to whitelist for incoming traffic to the masters."
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the Virtual Network resources"
  default     = {}
}

#############################################################################
# Default node pool

variable "default_node_pool" {
  description = "Default node pool"
  type = object({
    name                 = string
    vm_size              = string
    node_count           = number
    min_count            = number
    max_count            = number
    auto_scaling_enabled = bool
    upgrade_settings = optional(object({
      drain_timeout_in_minutes      = optional(number)
      node_soak_duration_in_minutes = optional(number)
      max_surge                     = string
    }))
  })
  default = {
    name                 = "core"
    vm_size              = "Standard_DS2_v2"
    node_count           = 3
    min_count            = 3
    max_count            = 3
    auto_scaling_enabled = true
    upgrade_settings = {
      max_surge = "10%"
    }
  }
}

#############################################################################
# ACR

variable "acr_core" {
  description = "List of ACR for Core subscription"
  type        = list(string)
  default     = []
}

variable "acr_shared" {
  description = "List of ACR for Shared subscription"
  type        = list(string)
  default     = []
}
