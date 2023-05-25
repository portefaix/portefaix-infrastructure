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

# resource "azurerm_subscription" "shared" {
#   subscription_name = local.shared_account
#   billing_scope_id  = data.azurerm_billing_enrollment_account_scope.this.id

#   tags = merge({
#     "Name" = local.shared_account
#   }, var.tags)
# }

# resource "azurerm_subscription" "testing" {
#   subscription_name = local.testing_account
#   billing_scope_id  = data.azurerm_billing_enrollment_account_scope.this.id

#   tags = merge({
#     "Name" = local.testing_account
#   }, var.tags)
# }

# resource "azurerm_subscription" "network" {
#   subscription_name = local.network_account
#   billing_scope_id  = data.azurerm_billing_enrollment_account_scope.this.id

#   tags = merge({
#     "Name" = local.network_account
#   }, var.tags)
# }

# resource "azurerm_subscription" "audit" {
#   subscription_name = local.audit_account
#   billing_scope_id  = data.azurerm_billing_enrollment_account_scope.this.id

#   tags = merge({
#     "Name" = local.audit_account
#   }, var.tags)
# }

# resource "azurerm_subscription" "core_prod" {
#   subscription_name = local.core_prod_account
#   billing_scope_id  = data.azurerm_billing_enrollment_account_scope.this.id

#   tags = merge({
#     "Name" = local.core_prod_account
#   }, var.tags)
# }

# resource "azurerm_subscription" "core_staging" {
#   subscription_name = local.core_staging_account
#   billing_scope_id  = data.azurerm_billing_enrollment_account_scope.this.id

#   tags = merge({
#     "Name" = local.core_staging_account
#   }, var.tags)
# }

# resource "azurerm_subscription" "core_dev" {
#   subscription_name = local.core_dev_account
#   billing_scope_id  = data.azurerm_billing_enrollment_account_scope.this.id

#   tags = merge({
#     "Name" = local.core_dev_account
#   }, var.tags)
# }
