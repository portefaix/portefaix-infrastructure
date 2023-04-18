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

#############################################################################
# Provider

region = "fr-par"

zone = "fr-par-1"

##############################################################################
# Terraform Cloud

organization = "portefaix"

workspaces = {

  # Organization (multiple accounts)

  portefaix-scaleway-sandbox-vpc = {
    directory      = "terraform/scaleway/vpc/sandbox"
    tags           = ["scaleway", "core", "vpc"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
    ]
  },
  portefaix-scaleway-sandbox-registry = {
    directory      = "terraform/scaleway/registry/sandbox"
    tags           = ["scaleway", "core", "kapsule"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
    ]
  },
  portefaix-scaleway-sandbox-kapsule = {
    directory      = "terraform/scaleway/kapsule/sandbox"
    tags           = ["scaleway", "core", "kapsule"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
    ]
  },
  portefaix-scaleway-sandbox-observability = {
    directory      = "terraform/scaleway/observability/sandbox"
    tags           = ["scaleway", "core", "stack"]
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
