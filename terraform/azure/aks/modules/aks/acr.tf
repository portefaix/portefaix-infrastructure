
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

resource "azurerm_role_assignment" "core" {
  for_each = toset(var.acr_core)

  principal_id                     = module.aks.kubelet_identity.object_id
  role_definition_name             = "AcrPull"
  scope                            = data.azurerm_container_registry.core[each.key].id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "shared" {
  for_each = toset(var.acr_shared)

  principal_id                     = module.aks.kubelet_identity.object_id
  role_definition_name             = "AcrPull"
  scope                            = data.azurerm_container_registry.shared[each.key].id
  skip_service_principal_aad_check = true
}
