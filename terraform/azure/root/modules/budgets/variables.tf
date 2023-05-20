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
# Budgets

variable "organization" {
  type        = string
  description = "Name of the organization"
}

variable "subscription_id" {
  type        = string
  description = "The Azure subscription id"
}

variable "budget_limit_amounts" {
  description = "The unit of measurement used for the budget forecast, actual spend, or budget threshold."
  type        = list(string)
  default = [
    5,
    25,
    50,
    100,
    200,
    300,
    400,
    500
  ]
}

variable "contact_emails" {
  type        = list(string)
  description = "The email addresses that I will receive alerts/notifications on."
  default     = ["nicolas.lamirault@gmail.com"]
}
