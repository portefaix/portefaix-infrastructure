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
  type        = string
  description = "The location linked to the project"
}

variable "network_project_id" {
  type = string
  description = "ID of the Network GCP project"
}

variable "shared_project_id" {
  type = string
  description = "ID of the Shared GCP project"
}

variable "logging_project_id" {
  type = string
  description = "ID of the Logging GCP project"
}

variable "testing_project_id" {
  type = string
  description = "ID of the Testing GCP project"
}

variable "audit_project_id" {
  type = string
  description = "ID of the Audit GCP project"
}

variable "core_dev_project_id" {
  type = string
  description = "ID of the Core Dev GCP project"
}

#############################################################################
# OIDC

variable "billing_account" {
  description = "The ID of the billing account to associate projects with."
  type        = string
}

variable "tfcloud_uri" {
  type = string
  description = "URL of Terraform Cloud"
}

variable "github_actions_uri" {
  type = string
  description = "URL of Github Actions"
}

variable "tfcloud_organization_id" {
  type = string
  description = "Terraform Cloud organization ID"
}