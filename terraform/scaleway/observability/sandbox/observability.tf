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

module "observability" {
  source = "../modules/observability"

  project_id   = var.project_id
  cluster_name = var.cluster_name
  region       = var.region
  mimir_tags   = merge(local.tags, var.mimir_tags)
  loki_tags    = merge(local.tags, var.loki_tags)
  tempo_tags   = merge(local.tags, var.loki_tags)
}
