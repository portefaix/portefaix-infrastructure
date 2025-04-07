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

region = "uk-london-1"

##############################################################################
# Terraform Cloud

organization = "portefaix"

workspaces = {

  # Shared

  portefaix-oci-shared-hub = {
    directory      = "terraform/oci/hub/shared"
    tags           = ["oci", "shared", "hub"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
    ]
  },

  # Security

  portefaix-oci-security-bastion = {
    directory      = "terraform/oci/bastion/dev"
    tags           = ["oci", "security", "bastion"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
    ]
  },

  # Core

  portefaix-oci-core-dev-vcn = {
    directory      = "terraform/oci/vcn/dev"
    tags           = ["oci", "core", "vcn"]
    gitops         = false
    branch         = "master"
    auto_apply     = true
    execution_mode = "remote"
    trigger = [
      "*.tf",
      "*.tfvars",
    ]
  },

  portefaix-oci-core-dev-oke = {
    directory      = "terraform/oci/oke/dev"
    tags           = ["oci", "core", "oke"]
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
