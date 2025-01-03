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
  description = "AWS Region"
}

variable "default_tags" {
  type        = map(string)
  description = "Tags for the AWS provider"
  default = {
    "Project"           = "Portefaix"
    "Made-By"           = "Terraform"
    "Portefaix-Version" = "v0.41.0"
  }
}


#############################################################################
# Spacelift

variable "root_space_id" {
  type        = string
  description = "The Portefaix space"
}

variable "space" {
  type        = string
  description = "The space for this project"
}

variable "environments" {
  type        = list(string)
  description = "List of environments"
}

variable "repository" {
  type        = string
  description = "Github repository"
}

variable "stacks" {
  type = map(object({
    project_root = string
    branch       = string
    environment  = string
    labels       = list(string)
  }))
  description = "Spacelift stacks"
}

variable "access_key" {
  type        = string
  description = "AWS access key for Cloudflare R2"
}

variable "secret_access_key" {
  type        = string
  description = "AWS secret key for Cloudflare R2"
}

variable "org_email" {
  type        = string
  description = "Email of the AWS Organization"
}

variable "org_email_domain" {
  type        = string
  description = "Email domain of the AWS Organization (like gmail.com)"
}

variable "portefaix_version" {
  type        = string
  description = "Portefaix version"
}
