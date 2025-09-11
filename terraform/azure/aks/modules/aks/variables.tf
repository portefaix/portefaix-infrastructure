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

#variable subscription_id {
#  type        = string
#  description = "The Subscription ID which should be used"
#}

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

variable "sku" {
  description = "The SKU name of the Kubernetes cluster. Possible values are Basic, Standard and Premium. Defaults to Basic"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "The container registry sku is invalid."
  }
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

variable "workload_identity_enabled" {
  type        = bool
  default     = true
  description = "Whether or not workload identity is enabled for the Kubernetes cluster."
}

variable "oidc_issuer_enabled" {
  type        = bool
  default     = true
  description = "Whether or not the OIDC issuer is enabled for the Kubernetes cluster."
}

variable "open_service_mesh_enabled" {
  type        = bool
  default     = false
  description = "Whether or not open service mesh is enabled for the Kubernetes cluster."
}


variable "private_cluster_enabled" {
  description = "If true cluster API server will be exposed only on internal IP address and available only in cluster vnet."
  type        = bool
  default     = false
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
# Additional Features

variable "azure_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether or not Azure Policy is enabled for the Kubernetes cluster."
}

variable "cost_analysis_enabled" {
  type        = bool
  default     = false
  description = "Whether or not cost analysis is enabled for the Kubernetes cluster. SKU must be Standard or Premium."
}

variable "disk_encryption_set_id" {
  type        = string
  default     = null
  description = "The disk encryption set ID for the Kubernetes cluster."
}

variable "http_application_routing_enabled" {
  type        = bool
  default     = false
  description = "Whether or not HTTP application routing is enabled for the Kubernetes cluster."
}

variable "image_cleaner_enabled" {
  type        = bool
  default     = true
  description = "Whether or not the image cleaner is enabled for the Kubernetes cluster."
}

variable "image_cleaner_interval_hours" {
  type = number
  # According to the [schema](https://github.com/hashicorp/terraform-provider-azurerm/blob/v4.0.0/internal/services/containers/kubernetes_cluster_resource.go#L404-L408), the default value should be `null`.
  default     = 72
  description = "(Optional) Specifies the interval in hours when images should be cleaned up. Defaults to `0`."

  validation {
    condition     = var.image_cleaner_interval_hours == null ? true : var.image_cleaner_interval_hours >= 24 && var.image_cleaner_interval_hours <= 2160
    error_message = "The image cleaner interval must be an int between 24 and 2160."
  }
}

#############################################################################
# Observability

variable "deploy_observability_tools" {
  description = "value to determine if observability tools should be deployed"
  type        = bool
  default     = false
}

variable "log_analytics_retention_in_days" {
  description = "The retention in days of the log analytics workspace"
  type        = number
  sensitive   = false
  default     = 30
}

variable "sku_observability" {
  description = "(Optional) Specifies the sku of the log analytics workspace"
  type        = string
  default     = "PerGB2018"

  validation {
    condition     = contains(["Free", "Standalone", "PerNode", "PerGB2018"], var.sku_observability)
    error_message = "The log analytics sku is incorrect."
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
