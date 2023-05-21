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

resource "azurerm_resource_group" "core_dev" {
  provider = azurerm.core_dev

  name     = format("%s-core-dev-%s", var.organization, local.rg_core)
  location = var.resource_group_location
}

# resource "azurerm_resource_group" "core_staging" {
#   provider = azurerm.core_staging

#   name     = format("%s-core-staging-%s", var.organization, local.rg_core)
#   location = var.resource_group_location
# }

# resource "azurerm_resource_group" "core_prod" {
#   provider = azurerm.core_prod

#   name     = format("%s-core-prod-%s", var.organization, local.rg_core)
#   location = var.resource_group_location
# }

resource "azurerm_resource_group" "network" {
  provider = azurerm.network

  name     = format("%s-network-%s", var.organization, local.rg_core)
  location = var.resource_group_location
}

resource "azurerm_resource_group" "logging" {
  provider = azurerm.logging

  name     = format("%s-logging-%s", var.organization, local.rg_core)
  location = var.resource_group_location
}

resource "azurerm_resource_group" "audit" {
  provider = azurerm.audit

  name     = format("%s-audit-%s", var.organization, local.rg_core)
  location = var.resource_group_location
}
