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

module "keyvault" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.10.1"

  name                = local.service_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  tenant_id = data.azurerm_client_config.current.tenant_id

  enable_telemetry = false

  legacy_access_policies = {
    main = {
      object_id = data.azurerm_client_config.current.object_id

      key_permissions = [
        "Create",
        "Get",
      ]
      secret_permissions = [
        "Set",
        "Get",
        "Delete",
      ]
      certificate_permissions = [
        "Get",
        "Create",
      ]
    }
  }
  legacy_access_policies_enabled = true

  secrets = {
    test_secret = {
      name = "portefaix-version"
    }
  }
  secrets_value = {
    test_secret = var.portefaix_version_secret
  }

  sku_name = var.sku

  tags = var.tags
}

# # tfsec:ignore:azure-keyvault-no-purge
# # tfsec:ignore:azure-keyvault-specify-network-acl
# resource "azurerm_key_vault" "this" {
#   name                       = local.service_name
#   location                   = azurerm_resource_group.this.location
#   resource_group_name        = azurerm_resource_group.this.name
#   tenant_id                  = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days = 7

#   sku_name = var.sku

#   tags = var.tags
# }

# resource "azurerm_key_vault_access_policy" "terraform" {
#   key_vault_id = azurerm_key_vault.this.id

#   tenant_id = data.azurerm_client_config.current.tenant_id
#   object_id = data.azurerm_client_config.current.object_id

#   key_permissions = [
#     "Create",
#     "Get",
#   ]

#   secret_permissions = [
#     "Set",
#     "Get",
#     "Delete",
#   ]

#   certificate_permissions = [
#     "Get",
#     "Create",
#   ]
# }

# resource "azurerm_key_vault_access_policy" "aks" {
#   key_vault_id = azurerm_key_vault.this.id

#   tenant_id = data.azurerm_client_config.current.tenant_id
#   object_id = data.azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id

#   key_permissions = [
#     "Get",
#   ]

#   secret_permissions = [
#     "Get",
#   ]

#   certificate_permissions = [
#     "Get",
#   ]
# }

# # tfsec:ignore:azure-keyvault-ensure-secret-expiry
# # tfsec:ignore:azure-keyvault-content-type-for-secret
# resource "azurerm_key_vault_secret" "version" {
#   key_vault_id = azurerm_key_vault.this.id
#   name         = "portefaix-version"
#   value        = var.portefaix_version_secret
# }
