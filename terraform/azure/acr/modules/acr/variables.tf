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

############################################################################
# ACR

variable "organization" {
  description = "Name of the organization."
  type        = string
}

variable "environment" {
  description = "Name of the environment"
  type        = string
}

variable "resource_group_location" {
  type        = string
  description = "The Azure Region where the Resource Group for AKS should exist."
}

variable "repositories" {
  description = "The ACR repositories"
  type = map(object({
    retention_policy = object({
      days    = number
      enabled = bool
    })
  }))
  default = {}
}

variable "georeplication_locations" {
  description = "A list of Azure locations where the container registry should be geo-replicated."
  type        = list(string)
  default     = []
}

variable "sku" {
  description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium. Defaults to Basic"
  type        = string
  default     = "Basic"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "The container registry sku is invalid."
  }
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the resources"
  default = {
    "made-by" = "terraform"
  }
}
