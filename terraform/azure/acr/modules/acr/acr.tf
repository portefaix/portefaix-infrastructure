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

module "avm-res-containerregistry-registry" {
  source  = "Azure/avm-res-containerregistry-registry/azurerm"
  version = "0.5.0"

  name                = replace(format("%s-%s", local.service_name, each.key), "-", "")
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = var.sku
  tags                = var.tags
}

# resource "azurerm_user_assigned_identity" "this" {
#   resource_group_name = azurerm_resource_group.this.name
#   location            = azurerm_resource_group.this.location
#   tags                = var.tags

#   name = replace(format("%s-Identity", local.service_name), "-", "")
# }
