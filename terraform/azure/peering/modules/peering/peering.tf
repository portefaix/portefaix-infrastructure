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

resource "azurerm_virtual_network_peering" "go" {
  provider = azurerm.core

  name                         = format("%s-core-%s-peer-to-hub", var.organization, var.environment)
  resource_group_name          = data.azurerm_resource_group.core.name
  virtual_network_name         = data.azurerm_virtual_network.core.name
  remote_virtual_network_id    = data.azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "back" {
  provider = azurerm.network

  name                         = format("%s-hub-peer-to-core-%s", var.organization, var.environment)
  resource_group_name          = data.azurerm_resource_group.hub.name
  virtual_network_name         = data.azurerm_virtual_network.hub.name
  remote_virtual_network_id    = data.azurerm_virtual_network.core.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
