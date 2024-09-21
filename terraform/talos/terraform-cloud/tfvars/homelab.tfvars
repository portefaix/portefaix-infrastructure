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
#

organization = "portefaix"

cloud_provider = "talos"
environment    = "homelab"

workspaces = {

  # Organization (multiple accounts)

  kubernetes = {
    # directory      = "terraform/talos/kubernetes/homelab"
    tags           = ["homelab", "core", "kubernetes"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
    ]
  },

  dns = {
    # directory      = "terraform/talos/dns/homelab"
    tags           = ["homelab", "core", "dns"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
    ]
  },
  waf = {
    # directory      = "terraform/talos/waf/homelab"
    tags           = ["homelab", "security", "waf", "security"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
    ]
  },
  observability = {
    # directory      = "terraform/talos/observability/homelab"
    tags           = ["homelab", "core", "observability"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
    ]
  },
  tunnel = {
    # directory      = "terraform/talos/tunnel/homelab"
    tags           = ["homelab", "core", "tunnel", "security"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
    ]
  },
}

gh_organization = "portefaix"
gh_repo         = "portefaix"
