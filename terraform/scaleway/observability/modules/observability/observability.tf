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

module "mimir" {
  source  = "nlamirault/observability/scaleway//modules/mimir"
  version = "1.0.0"

  cluster_name = var.cluster_name
  region       = var.region
  tags         = var.mimir_tags
}

module "loki" {
  source  = "nlamirault/observability/scaleway//modules/loki"
  version = "1.0.0"

  cluster_name = var.cluster_name
  region       = var.region
  tags         = var.loki_tags
}

module "tempo" {
  source  = "nlamirault/observability/scaleway//modules/tempo"
  version = "1.0.0"

  cluster_name = var.cluster_name
  region       = var.region
  tags         = var.tempo_tags
}

module "cockpit" {
  source  = "nlamirault/observability/scaleway//modules/cockpit"
  version = "1.0.0"

  cluster_name = var.cluster_name
}
