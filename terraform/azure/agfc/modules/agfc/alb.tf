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

resource "azurerm_application_load_balancer" "this" {
  name                = local.service_name
  location            = data.azurerm_resource_group.core.location
  resource_group_name = data.azurerm_resource_group.core.name
}

resource "azurerm_application_load_balancer_subnet_association" "this" {
  name                         = local.service_name
  application_load_balancer_id = azurerm_application_load_balancer.this.id
  subnet_id                    = azurerm_subnet.appgw_subnet.id
}

resource "azurerm_application_load_balancer_frontend" "this" {
  name                         = local.service_name
  application_load_balancer_id = azurerm_application_load_balancer.this.id
}
