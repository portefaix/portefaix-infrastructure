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
# Provider


#######################################################################
# Kubernetes cluster

variable "cluster_name" {
  description = "The name of the Talos Kubernetes cluster."
  type        = string
}

variable "cluster_endpoint" {
  description = "The IP adress of the Control Plane node."
  type        = string
}

variable "nodes" {
  description = "Configuration for cluster nodes"
  type = map(object({
    host_node    = string
    machine_type = string
    ip           = string
  }))
}

variable "extensions" {
  description = "List of Talos extensions to add"
  type        = list(string)
}
