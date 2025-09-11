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

data "azurerm_client_config" "current" {}

# data "azurerm_resource_group" "core" {
#   name = var.vnet_resource_group_name
# }

data "azurerm_virtual_network" "core" {
  name                = var.virtual_network_name
  resource_group_name = var.vnet_resource_group_name # data.azurerm_resource_group.core.name
}

data "azurerm_subnet" "aks" {
  name                 = var.aks_subnet_name
  virtual_network_name = data.azurerm_virtual_network.core.name
  resource_group_name  = var.vnet_resource_group_name # data.azurerm_resource_group.core.name
}

data "azurerm_subnet" "appgw" {
  name                 = var.appgw_subnet_name
  virtual_network_name = data.azurerm_virtual_network.core.name
  resource_group_name  = var.vnet_resource_group_name # data.azurerm_resource_group.core.name
}

data "azurerm_container_registry" "core" {
  for_each = toset(var.acr_core)

  name                = each.key
  resource_group_name = each.value
}

data "azurerm_container_registry" "shared" {
  for_each = toset(var.acr_shared)

  name                = each.key
  resource_group_name = each.value
}
