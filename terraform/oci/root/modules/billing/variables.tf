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

variable "organization" {
  type        = string
  description = "The organization name"
}

variable "tenancy_ocid" {
  description = "tenancy id where to create the sources"
  type        = string
}

variable "compartment_id" {
  type        = string
  description = "The OCID of the ompartment containing the budgets"
}

variable "budget_limit_amounts" {
  description = "The unit of measurement used for the budget forecast, actual spend, or budget threshold."
  type        = list(string)
  default = [
    5,
    # TODO: Can't create multiple budget for same compartment
    # 25,
    # 50,
    # 100,
    # 200,
    # 300,
    # 400,
    # 500
  ]
}

variable "freeform_tags" {
  description = "simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
  type        = map(any)
  default = {
    made-by = "terraform"
  }
}
