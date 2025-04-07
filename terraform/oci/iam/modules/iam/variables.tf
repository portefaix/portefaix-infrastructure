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

variable "region" {
  description = "the oci region where resources will be created"
  type        = string
}

#############################################################################
# IAM

variable "organization" {
  type        = string
  description = "Name of the Terraform Cloud organization"
}

variable "environment" {
  type        = string
  description = "Name of the Core environment"
}

variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
}

variable "users" {
  description = "Map of users to be created"
  type = map(object({
    name        = string
    description = string
    email       = string
  }))
  default = {}
}

variable "groups" {
  description = "Map of groups to be created"
  type = map(object({
    name        = string
    description = string
  }))
  default = {}
}

variable "user_group_memberships" {
  description = "Map of user-group memberships"
  type        = map(list(string))
  default     = {}
}

variable "policies" {
  description = "Map of policies to be created"
  type = map(object({
    name           = string
    description    = string
    compartment_id = string
    statements     = list(string)
  }))
  default = {}
}

variable "freeform_tags" {
  description = "simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
  type        = map(any)
  default = {
    made-by = "terraform"
  }
}
