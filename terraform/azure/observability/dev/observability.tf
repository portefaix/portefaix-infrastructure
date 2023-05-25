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

#tfsec:ignore:AZU012
module "observability" {
  source = "../modules/observability"

  cluster_rg_name = var.cluster_rg_name
  cluster_name    = var.cluster_name

  prometheus_namespace       = var.prometheus_namespace
  prometheus_service_account = var.prometheus_service_account
  prometheus_tags            = var.prometheus_tags

  mimir_namespace       = var.mimir_namespace
  mimir_service_account = var.mimir_service_account
  mimir_tags            = var.mimir_tags

  loki_namespace       = var.loki_namespace
  loki_service_account = var.loki_service_account
  loki_tags            = var.loki_tags

  tempo_namespace       = var.tempo_namespace
  tempo_service_account = var.tempo_service_account
  tempo_tags            = var.tempo_tags
}
