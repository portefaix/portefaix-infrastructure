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

variable "user_ocid" {
  description = "id of user that terraform will use to create the resources"
  type        = string
}

variable "fingerprint" {
  description = "fingerprint of oci api private key"
  type        = string
}

variable "private_key" {
  description = "OCI api private key used"
  type        = string
}

variable "region" {
  description = "the oci region where resources will be created"
  type        = string
}

#############################################################################
# Observability

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

variable "logs" {
  description = "Map of logs to be created"
  type = map(object({
    log_name            = string
    log_display_name    = string
    log_type            = string
    log_source_type     = string
    log_source_resource = string
    log_source_category = string
  }))
  default = {}
}

variable "alarms" {
  description = "Map of alarms to be created"
  type = map(object({
    display_name          = string
    metric_compartment_id = string
    namespace             = string
    query                 = string
    severity              = string
    body                  = string
    destinations          = list(string)
    is_enabled            = bool
  }))
  default = {}
}

variable "metrics_config" {
  description = "Metrics configuration"
  type = object({
    namespace      = string
    resource_group = string
    compartment_id = string
  })
  default = null
}

variable "notification_topics" {
  description = "Map of notification topics to be created"
  type = map(object({
    name        = string
    description = string
    subscriptions = list(object({
      protocol = string
      endpoint = string
    }))
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
