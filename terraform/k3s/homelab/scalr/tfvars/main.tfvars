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

  # Organization (multiple accounts)

  portefaix-homelab-dns = {
    directory = "terraform/homelab/dns"
    branch    = "main"
    # tags           = ["homelab", "core", "dns"]
    # gitops         = false
    # auto_apply     = true
    # execution_mode = "remote"
    # trigger = [
    #   "*.tf",
    #   "*.tfvars",
    # ]
  },
  portefaix-homelab-waf = {
    directory = "terraform/homelab/waf"
    branch    = "main"
    # tags           = ["homelab", "security", "waf"]
    # gitops         = false
    # auto_apply     = true
    # execution_mode = "remote"
    # trigger = [
    #   "*.tf",
    #   "*.tfvars",
    # ]
  },
  portefaix-homelab-observability = {
    directory = "terraform/homelab/observability"
    branch    = "main"
    # tags           = ["homelab", "core", "observability"]
    # gitops         = false
    # auto_apply     = true
    # execution_mode = "remote"
    # trigger = [
    #   "*.tf",
    #   "*.tfvars",
    # ]
  },
}

gh_repo = "portefaix/portefaix-infrastructure"
