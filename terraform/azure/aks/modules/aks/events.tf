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

resource "azurerm_eventhub_namespace" "this" {
  name                = local.service_name
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location
  sku                 = "Standard"
  capacity            = 1

  network_rulesets {
    default_action = "Deny"
    # Subnets where eventhub is reachable
    virtual_network_rule {
      subnet_id = data.azurerm_subnet.aks.id
    }
    virtual_network_rule {
      subnet_id = data.azurerm_subnet.appgw.id
    }
    trusted_service_access_enabled = true
  }

  tags = var.tags
}

resource "azurerm_eventhub" "this" {
  name                = format("%s-events", local.service_name)
  namespace_name      = azurerm_eventhub_namespace.aks.name
  resource_group_name = azurerm_resource_group.aks.name
  partition_count     = 2
  message_retention   = 1
}

resource "azurerm_eventhub_namespace_authorization_rule" "aks" {
  name                = format("%s-diagnostic", local.service_name)
  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = azurerm_resource_group.aks.name

  listen = false
  send   = true
  manage = false
}

resource "azurerm_eventhub_namespace_authorization_rule" "listen" {
  name                = format("%s-listen", local.service_name)
  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = azurerm_resource_group.aks.name

  listen = true
  send   = false
  manage = false
}

resource "azurerm_eventgrid_topic" "this" {
  name                = format("%s-events", local.service_name)
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location
  intput_schema       = "CloudEventSchemaV1_0"

  tags = var.tags
}

# resource "azurerm_eventgrid_system_topic" "acr" {
#   name                   = format("%s-acr", local.service_name)
#   resource_group_name    = azurerm_resource_group.example.name
#   location               = azurerm_resource_group.example.location
#   source_arm_resource_id = azurerm_storage_account.example.id
#   topic_type             = "Microsoft.ContainerRegistry.Registries"
# }

# resource "azurerm_eventgrid_event_subscription" "this" {
#   name                 = format("%s-events", local.service_name)
#   scope                = azurerm_eventgrid_topic.this.id
#   eventhub_endpoint_id = azurerm_eventhub.this.id
# }
