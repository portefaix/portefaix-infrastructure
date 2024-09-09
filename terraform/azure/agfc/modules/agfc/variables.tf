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
# Application Gateway

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
  description = "The Azure Region where the Resource Group will be created."
}

variable "core_rg_name" {
  type        = string
  description = "The name of the resource grupe of the Core virtual network"
}

variable "core_vnet_name" {
  type        = string
  description = "The name of the Core virtual network"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
