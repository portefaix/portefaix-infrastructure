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

#######################################################################
# Private Network

variable "name" {
  description = "The name of the cluster"
  type        = string
}

variable "type" {
  type        = string
  description = "The gateway type"
  default     = "VPC-GW-S"
}

variable "tags" {
  type        = list(string)
  description = "The tags associated with the VPC."
  default     = ["terraform"]
}
