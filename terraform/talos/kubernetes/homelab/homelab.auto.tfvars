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

#####################################################################""
# Provider


###########################################################################
# Kubernetes cluster

cluster_name = "portefaix-talos-homelab"

cluster_endpoint = "192.168.0.61"

nodes = {
  "portefaix" = {
    machine_type = "controlplane"
    ip           = "192.168.0.61"
  }
  # "portefaix-1" = {
  #   machine_type = "worker"
  #   ip = "192.168.0.208"
  # },
  # "portefaix-2" = {
  #   machine_type = "worker"
  #   ip = "192.168.0.116"
  # },
  # "portefaix-3" = {
  #   machine_type = "worker"
  #   ip = "192.168.0.252"
  # },
  # "portefaix-4" = {
  #   machine_type = "worker"
  #   ip = "192.168.0.234116"
  # },
  # "portefaix-5" = {
  #   machine_type = "worker"
  #   ip = "192.168.0.118"
  # },
  # "portefaix-6" = {
  #   machine_type = "worker"
  #   ip = "192.168.0.233 "
  # },
  # "portefaix-7" = {
  #   machine_type = "worker"
  #   ip = "192.168.0.250"
  # }
}

extensions = [
  "siderolabs/tailscale",
]
