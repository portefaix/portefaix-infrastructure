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

# resource "azurerm_network_ddos_protection_plan" "this" {
#   name                = local.service_name
#   resource_group_name = azurerm_resource_group.this.name
#   location            = azurerm_resource_group.this.location
#   tags                = var.tags
# }

module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.1.0"

  use_for_each = true

  vnet_name           = local.service_name
  vnet_location       = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  address_space   = var.address_space
  subnet_prefixes = var.subnet_prefixes
  subnet_names    = var.subnet_names

  # subnet_service_endpoints = {
  #   subnet2 = ["Microsoft.Storage", "Microsoft.Sql"],
  #   subnet3 = ["Microsoft.AzureActiveDirectory"]
  # }

  # subnet_enforce_private_link_endpoint_network_policies = {
  #   var.subnet_names[0] = true,
  # }

  # ddos_protection_plan = {
  #   id     = azurerm_network_ddos_protection_plan.this.id
  #   enable = true
  # }

  tags = var.tags
}
