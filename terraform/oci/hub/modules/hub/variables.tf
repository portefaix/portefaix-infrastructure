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
# Provider

variable "tenancy_ocid" {
  description = "tenancy id where to create the sources"
  type        = string
}

#############################################################################
# Hub

variable "hub_compartment_id" {
  type        = string
  description = "Hub Compartment ID"
}

#############################################################################
# Network Configuration
#############################################################################

variable "network_configuration_categories" {
  description = "Map of VCNs to create"
  type        = any
  default     = {}
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
