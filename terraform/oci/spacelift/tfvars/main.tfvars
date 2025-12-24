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

region = "uk-london-1"

##############################################################################
# Spacelift

repository = "portefaix-infrastructure"

space = "oraclecloud"

environments = [
  "orga",
  "shared",
  "security",
  "dev",
  "staging",
  "prod",
]

stacks = {
  portefaix-oci-shared-hub = {
    project_root = "terraform/oci/hub"
    labels       = ["shared", "networking", "hub"]
    environment  = "shared"
    branch       = "feat/oci-refactoring"
    dependencies = []
  },
  portefaix-oci-dev-vcn = {
    project_root = "terraform/oci/vcn"
    labels       = ["core", "networking", "vcn"]
    environment  = "dev"
    branch       = "feat/oci-refactoring"
    dependencies = []
  },
  portefaix-oci-staging-vcn = {
    project_root = "terraform/oci/vcn"
    labels       = ["core", "networking", "vcn"]
    environment  = "staging"
    branch       = "feat/oci-refactoring"
    dependencies = []
  },
  portefaix-oci-prod-vcn = {
    project_root = "terraform/oci/vcn"
    labels       = ["core", "networking", "vcn"]
    environment  = "prod"
    branch       = "feat/oci-refactoring"
    dependencies = []
  },
  portefaix-oci-dev-oke = {
    project_root = "terraform/oci/oke"
    labels       = ["core", "oke"]
    environment  = "dev"
    branch       = "feat/oci-refactoring"
    dependencies = []
  },
}
