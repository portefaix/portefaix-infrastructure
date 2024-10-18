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

variable "cloudflare_account_id" {
  description = "The Cloudflare account ID"
  type        = string
}

variable "cloudflare_api_token" {
  description = "The Cloudflare API token"
  type        = string
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

variable "repository" {
  type        = string
  description = "Github repository"
}

variable "stacks" {
  type = map(object({
    project_root = string
    branch       = string
    labels       = list(string)
  }))
  description = "Spacelift stacks"
}
