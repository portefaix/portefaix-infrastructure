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

variable "name" {
  type        = string
  description = "The name of the Exoscale organization landing zone."
}

variable "default_service_strategy" {
  type        = string
  description = "Default IAM Org Policy strategy applied to services with no explicit rule (allow or deny)."
  default     = "allow"
}

variable "iam_roles" {
  description = "The IAM roles to create, keyed by environment name (e.g. sandbox, staging, prod)."
  type = map(object({
    description    = string
    editable       = optional(bool, true)
    permissions    = optional(list(string), [])
    labels         = optional(map(string), {})
    create_api_key = optional(bool, false)
    policy = optional(object({
      default_service_strategy = string
      services = map(object({
        type = string
        rules = optional(list(object({
          action     = string
          expression = string
        })))
      }))
    }))
  }))
  default = {}
}
