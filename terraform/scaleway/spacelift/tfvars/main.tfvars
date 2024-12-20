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

region = "fr-par"

zone = "fr-par-1"

##############################################################################
# Spacelift

repository = "portefaix-infrastructure"

space = "scaleway"

environments = ["sandbox"]

stacks = {
  portefaix-scaleway-sandbox-vpc = {
    project_root = "terraform/scaleway/vpc"
    labels       = ["core", "vpc"]
    environment  = "sandbox"
    branch       = "main"
    dependencies = []
  },
  portefaix-scaleway-sandbox-registry = {
    project_root = "terraform/scaleway/registry"
    labels       = ["core", "kapsule"]
    environment  = "sandbox"
    branch       = "main"
    dependencies = []
  },
  portefaix-scaleway-sandbox-kapsule = {
    project_root = "terraform/scaleway/kapsule"
    labels       = ["core", "kapsule"]
    environment  = "sandbox"
    branch       = "main"
    dependencies = [
      "portefaix-scaleway-sandbox-vpc",
    ]
  },
  portefaix-scaleway-sandbox-observability = {
    project_root = "terraform/scaleway/observability"
    labels       = ["core", "stack"]
    environment  = "sandbox"
    branch       = "main"
    dependencies = []
  },
  portefaix-scaleway-sandbox-eso = {
    project_root = "terraform/scaleway/eso"
    labels       = ["core", "stack"]
    environment  = "sandbox"
    branch       = "main"
    dependencies = []
  },
}
