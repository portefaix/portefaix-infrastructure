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
# Hub

variable "hub_compartment_id" {
  type        = string
  description = "Hub Compartment ID"
}

#############################################################################
# Network Configuration
#############################################################################

variable "vcns" {
  description = "Map of VCNs to create"
  type        = any
}

variable "hub_subnets" {
  description = "Map of Hub subnets to create"
  type        = any
}

variable "dev_subnets" {
  description = "Map of Dev subnets to create"
  type        = any
}

variable "staging_subnets" {
  description = "Map of Staging subnets to create"
  type        = any
}

variable "prod_subnets" {
  description = "Map of Prod subnets to create"
  type        = any
}

variable "hub_security_lists" {
  description = "Map of Hub security lists to create"
  type        = any
}

variable "dev_security_lists" {
  description = "Map of Dev security lists to create"
  type        = any
}

variable "staging_security_lists" {
  description = "Map of Staging security lists to create"
  type        = any
}

variable "prod_security_lists" {
  description = "Map of Prod security lists to create"
  type        = any
}

variable "hub_route_tables" {
  description = "Map of Hub route tables to create"
  type        = any
}

variable "dev_route_tables" {
  description = "Map of Dev route tables to create"
  type        = any
}

variable "staging_route_tables" {
  description = "Map of Staging route tables to create"
  type        = any
}

variable "prod_route_tables" {
  description = "Map of Prod route tables to create"
  type        = any
}

variable "vcn_gateways" {
  description = "Map of VCN-specific gateways to create"
  type        = any
}

variable "drg_config" {
  description = "DRG configuration"
  type        = any
}

# #############################################################################
# Common

variable "freeform_tags" {
  description = "simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
  type        = map(any)
  default = {
    Managed-By = "Terraform"
  }
}
