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

data "azurerm_subscription" "root" {
}

data "azurerm_subscription" "core_dev" {
  subscription_id = var.subscription_core_dev_id
}

# data "azurerm_subscription" "core_staging" {
#     subscription_id = var.subscription_core_staging_id
# }

# data "azurerm_subscription" "core_prod" {
#     subscription_id = var.subscription_core_prod_id
# }

data "azurerm_subscription" "shared" {
  subscription_id = var.subscription_shared_id
}

# data "azurerm_subscription" "network" {
#   subscription_id = var.subscription_network_id
# }

# data "azurerm_subscription" "testing" {
#   subscription_id = var.subscription_testing_id
# }

# data "azurerm_subscription" "audit" {
#   subscription_id = var.subscription_audit_id
# }

data "azurerm_subscription" "logging" {
  subscription_id = var.subscription_logging_id
}

# data "azurerm_subscription" "suspended" {
#   subscription_id = var.subscription_suspended_id
# }
