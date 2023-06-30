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
# Scalr

account_id      = "acc-v0nvj3kjgim5c7dvb"
environment_id  = "env-v0nvj3kjiijbjp115"
vcs_provider_id = "vcs-v0nvj3kkc7j9jnirm"

tags = ["main"]

workspaces = {
  portefaix-homelab-dns = {
    directory = "terraform/k3s/homelab/dns"
    branch    = "main"
  },
  portefaix-homelab-observability = {
    directory = "terraform/k3s/homelab/observability"
    branch    = "main"
  },
  portefaix-homelab-waf = {
    directory = "terraform/k3s/homelab/waf"
    branch    = "feat/scalr"
  },
}

gh_repo = "portefaix/portefaix-infrastructure"
