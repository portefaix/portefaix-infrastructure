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
# Spacelift

repository = "portefaix-infrastructure"

space = "talos"

environments = ["homelab"]

stacks = {
  portefaix-homelab-dns = {
    project_root = "terraform/talos/dns"
    branch       = "feat/spacelif-refactoring"
    labels       = ["core", "dns"]
    environment  = "homelab"
    branch       = "main"
    dependencies = []
  },
  portefaix-homelab-waf = {
    project_root = "terraform/talos/waf"
    branch       = "feat/spacelif-refactoring"
    labels       = ["security", "waf"]
    environment  = "homelab"
    branch       = "main"
    dependencies = []
  },
  portefaix-homelab-observability = {
    project_root = "terraform/talos/observability"
    branch       = "feat/spacelif-refactoring"
    labels       = ["core", "observability"]
    environment  = "homelab"
    branch       = "main"
    dependencies = []
  },
  portefaix-homelab-zero-trust = {
    project_root = "terraform/talos/zero-trust"
    branch       = "main"
    labels       = ["security", "zero-trust", "access"]
    environment  = "homelab"
    branch       = "main"
    dependencies = []
  },
}
