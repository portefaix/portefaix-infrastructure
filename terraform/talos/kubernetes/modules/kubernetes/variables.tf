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
# Kubernetes

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "cluster_endpoint" {
  description = "IP address of the cluster endpoint"
  type        = string
}

variable "talos_version" {
  description = "Which version of Talos to use"
  type        = string
  default     = "v1.7.6"
}

variable "nodes" {
  description = "Configuration for cluster nodes"
  type = map(object({
    host_node    = string
    machine_type = string
    ip           = string
  }))
  default = {}
}

# variable "extensions" {
#   description = "List of Talos extensions to add"
#   type        = list(string)
# }

# variable "image" {
#   description = "Talos image configuration"
#   type = object({
#     factory_url = optional(string, "https://factory.talos.dev")
#     schematic = string
#     version   = string
#     update_schematic = optional(string)
#     update_version = optional(string)
#     extensions = list(string)
#   })
# }

# variable "tags" {
#   type        = string
#   description = "Tags"
#   default     = "terraform"
# }
