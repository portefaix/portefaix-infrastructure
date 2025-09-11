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
# Firewall

variable "organization" {
  type        = string
  description = "Specifies the name of the Organization"
}

variable "hub_rg_name" {
  type        = string
  description = "The name of the resource grupe of the Hub virtual network"
}

variable "hub_vnet_name" {
  type        = string
  description = "The name of the Hub virtual network"
}

variable "subnet_prefix" {
  type        = string
  description = "The address prefix to use for the Azure Firewall subnet"
}

variable "zones" {
  description = "Specifies the availability zones of the Azure Firewall"
  default     = ["1", "2", "3"]
  type        = list(string)
}

variable "sku_firewall" {
  description = "SKU name of the Firewall. Possible values are AZFW_Hub and AZFW_VNet. Changing this forces a new resource to be created."
  default     = "AZFW_VNet"
  type        = string

  validation {
    condition     = contains(["AZFW_Hub", "AZFW_VNet"], var.sku_firewall)
    error_message = "The value of the sku name property of the firewall is invalid."
  }
}

variable "sku" {
  description = "SKU tier of the Firewall. Possible values are Premium, Standard, and Basic."
  default     = "Standard"
  type        = string

  validation {
    condition     = contains(["Premium", "Standard", "Basic"], var.sku)
    error_message = "The value of the sku tier property of the firewall is invalid."
  }
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
