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
# VNet

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
  description = "The Azure Region where the Resource Group should exist"
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
}

variable "subnets" {
  type = map(object({
    address_prefixes = optional(list(string))
    name             = string
  }))
  description = "A map of subnets to create"
  default     = {}
}

variable "sku" {
  description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium. Defaults to Basic"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "The container registry sku is invalid."
  }
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
  default = {
    "made-by" = "terraform"
  }
}

variable "authorized_ip_ranges" {
  type        = list(string)
  description = "The IP ranges to whitelist for incoming traffic to the masters."
}
