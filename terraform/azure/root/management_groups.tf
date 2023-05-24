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

resource "azurerm_management_group" "this" {
  display_name = var.organization

  subscription_ids = [
    data.azurerm_subscription.root.subscription_id,
  ]
}

resource "azurerm_management_group" "security" {
  display_name               = local.security_group
  parent_management_group_id = azurerm_management_group.this.id

  subscription_ids = [
    data.azurerm_subscription.logging.subscription_id,
    data.azurerm_subscription.audit.subscription_id,
  ]
}

resource "azurerm_management_group" "shared" {
  display_name               = local.shared_group
  parent_management_group_id = azurerm_management_group.this.id

  subscription_ids = [
    data.azurerm_subscription.shared.subscription_id,
    data.azurerm_subscription.network.subscription_id,
    # data.azurerm_subscription.testing.subscription_id,
  ]
}

resource "azurerm_management_group" "core_dev" {
  display_name               = local.core_group
  parent_management_group_id = azurerm_management_group.this.id

  subscription_ids = [
    data.azurerm_subscription.core_dev.subscription_id,
    # data.azurerm_subscription.core_staging.subscription_id,
    # data.azurerm_subscription.core_prod.subscription_id,
  ]
}

# resource "azurerm_management_group" "suspended" {
#   display_name               = "Suspended"
#   parent_management_group_id = azurerm_management_group.this.id

#   subscription_ids = [
#     data.azurerm_subscription.suspended.subscription_id,
#   ]
# }
