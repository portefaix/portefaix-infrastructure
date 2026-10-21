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
  description = "The name of the IAM role."
}

variable "description" {
  type        = string
  description = "A free-form text describing the IAM role."
}

variable "editable" {
  type        = bool
  description = "Whether the IAM role policy is editable after creation."
  default     = true
}

variable "permissions" {
  type        = list(string)
  description = "IAM role permissions."
  default     = []
}

variable "labels" {
  type        = map(string)
  description = "IAM role labels."
  default     = {}
}

variable "create_api_key" {
  type        = bool
  description = "Whether to create an IAM API key bound to this role."
  default     = false
}

variable "policy" {
  description = "IAM role policy: default strategy plus per-service overrides (allow, deny, or rules)."
  type = object({
    default_service_strategy = string
    services = map(object({
      type = string
      rules = optional(list(object({
        action     = string
        expression = string
      })))
    }))
  })
  default = null

  validation {
    condition = var.policy == null || alltrue([
      for service in keys(var.policy.services) : contains([
        "ai", "cdn", "compute", "compute-legacy", "dbaas", "dns",
        "iam", "kms", "networking", "organization", "partner", "sos",
      ], service)
    ])
    error_message = "policy.services keys must be one of: ai, cdn, compute, compute-legacy, dbaas, dns, iam, kms, networking, organization, partner, sos."
  }
}
