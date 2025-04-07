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
    labels       = list(string)
    environment  = string
    dependencies = list(string)
  }))
  description = "Spacelift stacks"
}

variable "exo_api_key" {
  type        = string
  description = "Exoscale API key"
}

variable "exo_api_secret" {
  type        = string
  description = "Exoscale API secret"
}

variable "aws_access_key_id" {
  type        = string
  description = "AWS access key"
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS secret key"
}

variable "aws_default_region" {
  type        = string
  description = "The AWS default region"
}

variable "aws_region" {
  type        = string
  description = "The AWS Region"
}
