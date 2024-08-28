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

#tfsec:ignore:AZU007
#tfsec:ignore:AZU008
#tfsec:ignore:AZU009
#tfsec:ignore:GEN001
module "aks" {
  source  = "Azure/aks/azurerm"
  version = "9.1.0"
  # source = "git://github.com/Azure/terraform-azurerm-aks.git?ref=master"

  cluster_name              = local.service_name
  prefix                    = local.service_name
  resource_group_name       = azurerm_resource_group.aks.name
  kubernetes_version        = var.kubernetes_version
  orchestrator_version      = var.kubernetes_version
  automatic_channel_upgrade = var.automatic_channel_upgrade

  vnet_subnet_id = data.azurerm_subnet.aks.id

  private_cluster_enabled = var.private_cluster_enabled

  network_plugin = var.network_plugin
  network_policy = var.network_policy

  # net_profile_pod_cidr           = var.net_profile_pod_cidr
  net_profile_service_cidr   = var.net_profile_service_cidr
  net_profile_dns_service_ip = var.net_profile_dns_service_ip

  public_ssh_key = var.public_ssh_key

  role_based_access_control_enabled = true
  rbac_aad_managed                  = true
  # rbac_aad_admin_group_object_ids  = var.admin_group_object_ids

  # enable_log_analytics_workspace  = false
  enable_auto_scaling = var.enable_auto_scaling

  azure_policy_enabled = var.azure_policy_enabled

  open_service_mesh_enabled = var.open_service_mesh_enabled

  key_vault_secrets_provider_enabled = var.key_vault_secrets_provider_enabled
  secret_rotation_enabled            = var.secret_rotation_enabled

  workload_identity_enabled = var.workload_identity_enabled
  oidc_issuer_enabled       = var.oidc_issuer_enabled

  identity_type = "UserAssigned"
  identity_ids  = [azurerm_user_assigned_identity.aks_identity.id]

  os_disk_size_gb           = var.os_disk_size_gb
  agents_min_count          = var.agents_min_count
  agents_max_count          = var.agents_max_count
  agents_count              = var.agents_count
  agents_max_pods           = var.agents_max_pods
  agents_pool_name          = var.agents_pool_name
  agents_availability_zones = var.agents_availability_zones
  agents_type               = var.agents_type
  agents_size               = var.agents_size
  agents_labels             = var.agents_labels
  agents_tags               = var.agents_tags

  maintenance_window = var.maintenance_window

  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges

  # TODO: AKS: Another node pools
  # labels: kind/feature, priority/high, lifecycle/frozen, area/terraform, cloud/azure
  # https://github.com/Azure/terraform-azurerm-aks/pull/127
  # node_pools = var.node_pools

  tags = var.tags

  node_pools = var.node_pools

  depends_on = [
    azurerm_resource_group.aks
  ]
}
