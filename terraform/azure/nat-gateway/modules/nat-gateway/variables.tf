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
# Nat Gateway

variable "organization" {
  type        = string
  description = "Specifies the name of the Organization"
}

variable "environment" {
  type        = string
  description = "Specifies the name of the environment"
}

variable "resource_group_location" {
  type        = string
  description = "The Azure Region where the Resource Group should exist."
}

variable "core_rg_name" {
  description = "Name of the Core resource group."
  type        = string
}

variable "core_vnet_name" {
  type        = string
  description = "The Core virtual network name"
}

variable "subnet_prefix" {
  type        = string
  description = "The address prefix to use for the Azure Bastion subnet"
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

variable "idle_timeout_in_minutes" {
  description = "The idle timeout which should be used in minutes."
  type        = number
  default     = 4
}

variable "zones" {
  description = "A list of Availability Zones in which this NAT Gateway should be located. Changing this forces a new NAT Gateway to be created."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
}
