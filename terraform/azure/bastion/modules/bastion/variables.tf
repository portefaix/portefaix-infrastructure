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


#############################################################################
# Bastion

variable "hub_rg_name" {
  type        = string
  description = "The name of the resource grupe of the Hub virtual network"
}

variable "hub_vnet_name" {
  type        = string
  description = "The name of the Hub virtual network"
}

variable "service_name" {
  type        = string
  description = "Specifies the name of the Bastion Host"
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

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
