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
# Observability

variable "project_id" {
  type        = string
  description = "ID of the project"
}

variable "cluster_name" {
  type        = string
  description = "Name of the Kapsule cluster"
}

variable "region" {
  type        = string
  description = "The region in which the buckets should be created"
}

variable "mimir_tags" {
  type        = map(string)
  description = "Tags for Mimir"
  default = {
    "Made-By" = "terraform"
  }
}

variable "loki_tags" {
  type        = map(string)
  description = "Tags for Loki"
  default = {
    "Made-By" = "terraform"
  }
}

variable "tempo_tags" {
  type        = map(string)
  description = "Tags for Tempo"
  default = {
    "Made-By" = "terraform"
  }
}
