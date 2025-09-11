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

module "prometheus" {
  source  = "nlamirault/observability/azurerm//modules/prometheus"
  version = "3.0.0"

  cluster_name            = var.cluster_name
  cluster_rg_name         = data.azurerm_resource_group.this.name
  resource_group_name     = data.azurerm_resource_group.this.name
  resource_group_location = data.azurerm_resource_group.this.location
  namespace               = var.prometheus_namespace
  service_account         = var.prometheus_service_account

  tags = var.prometheus_tags
}

module "mimir" {
  source  = "nlamirault/observability/azurerm//modules/mimir"
  version = "3.0.0"

  cluster_name            = var.cluster_name
  cluster_rg_name         = data.azurerm_resource_group.this.name
  resource_group_name     = data.azurerm_resource_group.this.name
  resource_group_location = data.azurerm_resource_group.this.location
  namespace               = var.mimir_namespace
  service_account         = var.mimir_service_account
  bucket_name             = local.mimir_service
  tags                    = var.mimir_tags
}

module "loki" {
  source  = "nlamirault/observability/azurerm//modules/loki"
  version = "3.0.0"

  cluster_name            = var.cluster_name
  cluster_rg_name         = data.azurerm_resource_group.this.name
  resource_group_name     = data.azurerm_resource_group.this.name
  resource_group_location = data.azurerm_resource_group.this.location
  namespace               = var.loki_namespace
  service_account         = var.loki_service_account
  bucket_name             = local.loki_service
  tags                    = var.loki_tags
}

module "tempo" {
  source  = "nlamirault/observability/azurerm//modules/tempo/"
  version = "3.0.0"

  cluster_name            = var.cluster_name
  cluster_rg_name         = data.azurerm_resource_group.this.name
  resource_group_name     = data.azurerm_resource_group.this.name
  resource_group_location = data.azurerm_resource_group.this.location
  namespace               = var.tempo_namespace
  service_account         = var.tempo_service_account
  bucket_name             = local.tempo_service
  tags                    = var.tempo_tags
}