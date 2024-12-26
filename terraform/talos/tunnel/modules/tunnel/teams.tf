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

resource "cloudflare_teams_list" "k8s_apiserver_ips" {
  account_id = var.account_id
  name       = "Kubernetes API IPs"
  type       = "IP"
  items      = [var.k8s_ip]
}

resource "cloudflare_teams_rule" "k8s_apiserver_zero_trust_http" {
  account_id  = var.account_id
  name        = "Don't inspect Kubernetes API"
  description = "Allow connections from kubectl to API"
  precedence  = 10000
  action      = "off"
  enabled     = true
  filters     = ["http"]
  traffic     = format("any(http.conn.dst_ip[*] in $%s)", replace(cloudflare_teams_list.k8s_apiserver_ips.id, "-", ""))
}
