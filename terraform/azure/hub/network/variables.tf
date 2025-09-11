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

variable "subscription_network_id" {
  type        = string
  description = "The Subscription ID for Networking resources"
}

############################################################################
# VNet

variable "organization" {
  description = "Name of the organization"
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


variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
  default = {
    "made-by" = "terraform"
  }
}
