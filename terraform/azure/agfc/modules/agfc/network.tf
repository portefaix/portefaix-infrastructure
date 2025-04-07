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

# create subnet for Application Gateway for Containers
resource "azurerm_subnet" "appgw_subnet" {
  name                 = local.service_name
  resource_group_name  = data.azurerm_resource_group.core.name
  virtual_network_name = data.azurerm_virtual_network.core.name
  address_prefixes     = ["192.168.0.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name = "Microsoft.ServiceNetworking/trafficControllers"
    }
  }
}

# create network security group & associate with subnet
resource "azurerm_network_security_group" "this" {
  name                = local.service_name
  location            = data.azurerm_resource_group.core.location
  resource_group_name = data.azurerm_resource_group.core.name
}

resource "azurerm_subnet_network_security_group_association" "this" {
  subnet_id                 = azurerm_subnet.appgw_subnet.id
  network_security_group_id = azurerm_network_security_group.this.id
}
