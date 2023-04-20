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
  description = "The region that will be used as default value for all resources."
}

variable "zone" {
  type        = string
  description = "The zone that will be used as default value for all resources"
}

#############################################################################
# Terraform Cloud

variable "organization" {
  type        = string
  description = "Name of the Terraform Cloud organization"
}

variable "workspaces" {
  type = map(object({
    directory      = string
    tags           = list(string)
    gitops         = bool
    branch         = string,
    auto_apply     = bool,
    execution_mode = string,
    trigger        = list(string)
  }))
  description = "Terraform cloud workspaces"
}

variable "gh_organization" {
  type        = string
  description = "Organization name in your VCS provider"
}

variable "gh_repo" {
  type        = string
  description = "Repository name in your VCS provider"
}

variable "github_oauth_token" {
  type        = string
  description = "Github token for Terraform Cloud"
}

variable "env_scw_access_key" {
  type        = string
  description = "Scaleway access key"
}

variable "env_scw_secret_key" {
  type        = string
  description = "Scaleway secret key"
}

variable "env_scw_project_id" {
  type        = string
  description = "Scaleway Project ID"
}

variable "env_scw_organization_id" {
  type        = string
  description = "Scaleway Organization ID"
}

variable "env_aws_access_key" {
  type        = string
  description = "AWS access key"
}

variable "env_aws_secret_key" {
  type        = string
  description = "AWS secret key"
}

variable "env_aws_default_region" {
  type        = string
  description = "The AWS default region"
}

variable "env_aws_region" {
  type        = string
  description = "The AWS Region"
}
