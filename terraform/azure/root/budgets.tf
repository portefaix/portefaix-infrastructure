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

module "budget_root" {
  source = "./modules/budgets"

  organization    = var.organization
  subscription_id = data.azurerm_subscription.root.id
}

module "budget_security" {
  source = "./modules/budgets"

  organization    = var.organization
  subscription_id = data.azurerm_subscription.logging.id
}

module "budget_audit" {
  source = "./modules/budgets"

  organization    = var.organization
  subscription_id = data.azurerm_subscription.audit.id
}

module "budget_shared" {
  source = "./modules/budgets"

  organization    = var.organization
  subscription_id = data.azurerm_subscription.shared.id
}

# module "budget_network" {
#   source = "./modules/budgets"

#   organization = var.organization
#   subscription_id = data.azurerm_subscription.network.id
# }

# module "budget_testing" {
#   source = "./modules/budgets"

#   organization = var.organization
#   subscription_id = data.azurerm_subscription.testing.id
# }

module "budget_core_dev" {
  source = "./modules/budgets"

  organization    = var.organization
  subscription_id = data.azurerm_subscription.core_dev.id
}

# module "budget_core_staging" {
#   source = "./modules/budgets"

#   organization = var.organization
#   subscription_id = data.azurerm_subscription.core_staging.id
# }

# module "budget_core_prod" {
#   source = "./modules/budgets"

#   organization = var.organization
#   subscription_id = data.azurerm_subscription.core_prod.id
# }
