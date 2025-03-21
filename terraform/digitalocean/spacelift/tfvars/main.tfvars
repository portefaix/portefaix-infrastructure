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

repository = "portefaix-infrastructure"

space = "digitalocean"

environments = ["dev"]

stacks = {
  portefaix-digitalocean-dev-vpc = {
    project_root = "terraform/digitalocean/vpc"
    labels       = ["core", "vpc"]
    environment  = "dev"
    branch       = "feat/spacelift-digitalocean"
    dependencies = []
  },
  portefaix-digitalocean-dev-doks = {
    project_root = "terraform/digitalocean/doks"
    labels       = ["core", "doks"]
    environment  = "dev"
    branch       = "feat/spacelift-digitalocean"
    dependencies = []
  },
  portefaix-digitalocean-dev-containerregistry = {
    project_root = "terraform/digitalocean/containerregistry"
    labels       = ["core", "containerregistry"]
    environment  = "dev"
    branch       = "feat/spacelift-digitalocean"
    dependencies = []
  }
}
