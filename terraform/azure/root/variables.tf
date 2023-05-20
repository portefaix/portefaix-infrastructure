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


#############################################################################
# Groups

variable "organization" {
  type        = string
  description = "Name of the organization"
}

variable "subscription_core_dev_id" {
  type        = string
  description = "The Subscription ID for Core Dev resources"
}

# variable "subscription_core_staging_id" {
#   type = string
#   description = "The Subscription ID for Core Staging resources"
# }

# variable "subscription_core_prod_id" {
#   type = string
#   description = "The Subscription ID for Core Prod resources"
# }

variable "subscription_shared_id" {
  type        = string
  description = "The Subscription ID for Shared resources"
}

# variable "subscription_network_id" {
#   type = string
#   description = "The Subscription ID for Networkin resources"
# }

# variable "subscription_testing_id" {
#   type = string
#   description = "The Subscription ID for Testing resources"
# }

variable "subscription_logging_id" {
  type        = string
  description = "The Subscription ID for Logging resources"
}

# variable "subscription_audit_id" {
#   type = string
#   description = "The Subscription ID for Audit resources"
# }

# variable "subscription_suspended_id" {
#   type = string
#   description = "The Suspended subscription ID"
# }

#############################################################################
# Secrets

# variable "portefaix_version" {
#   type        = string
#   description = "Portefaix version"
# }
