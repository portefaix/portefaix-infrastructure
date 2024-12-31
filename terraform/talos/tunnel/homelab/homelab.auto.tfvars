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


##############################################################################
# Tunnel

zone_name   = "portefaix.xyz"
tunnel_name = "portefaix-homelab"
# tunnel_id   = "21b10baa-4cce-4bb0-b00d-2a951ad5d0c5"

applications = [
  "alertmanager",
  "alloy-events",
  "alloy-logs",
  "alloy-metrics",
  "alloy-profiles",
  "alloy-traces",
  "argo-cd",
  "argo-workflows",
  "cilium",
  "grafana",
  "homepage",
  "kargo",
  "prometheus",
  "pyrra",
  "quickwit",
  "fleet",
  "keep"
]
