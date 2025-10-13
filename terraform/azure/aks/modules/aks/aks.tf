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

module "aks" {
  source  = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version = "0.3.2"

  name                = local.service_name
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location

  node_os_channel_upgrade = "SecurityPatch"
  private_cluster_enabled = var.private_cluster_enabled

  # Additional Features
  azure_policy_enabled   = var.azure_policy_enabled
  cost_analysis_enabled  = var.sku == "Free" ? false : var.cost_analysis_enabled
  disk_encryption_set_id = var.disk_encryption_set_id
  # dns_prefix                       = var.dns_prefix
  # dns_prefix_private_cluster       = var.dns_prefix_private_cluster
  # edge_zone                        = var.edge_zone
  http_application_routing_enabled = var.http_application_routing_enabled
  image_cleaner_enabled            = var.image_cleaner_enabled
  image_cleaner_interval_hours     = var.image_cleaner_interval_hours

  oidc_issuer_enabled       = var.oidc_issuer_enabled
  workload_identity_enabled = var.workload_identity_enabled
  open_service_mesh_enabled = var.open_service_mesh_enabled
  local_account_disabled    = true

  sku_tier = var.sku

  api_server_access_profile = {
    authorized_ip_ranges = var.authorized_ip_ranges
  }

  azure_active_directory_role_based_access_control = {
    azure_rbac_enabled = true
    tenant_id          = data.azurerm_client_config.current.tenant_id
  }

  network_profile = {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_policy      = "cilium"
    network_data_plane  = "cilium"
  }

  default_node_pool = var.default_node_pool

  key_vault_secrets_provider = {
    secret_rotation_enabled = true
  }

  managed_identities = {
    system_assigned = true
  }

  monitor_metrics = var.deploy_observability_tools ? {} : null
  oms_agent = var.deploy_observability_tools ? {
    log_analytics_workspace_id      = azurerm_log_analytics_workspace.this[0].id
    msi_auth_for_monitoring_enabled = true
  } : null

  maintenance_window_auto_upgrade = {
    frequency   = "Weekly"
    interval    = "1"
    day_of_week = "Sunday"
    duration    = 4
    utc_offset  = "+00:00"
    start_time  = "00:00"
    start_date  = "2025-10-15T00:00:00Z"
  }

  tags = var.tags
}

module "iam_aks_acr_core" {
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "0.3.0"

  for_each = toset(var.acr_core)

  user_assigned_managed_identities_by_principal_id = {
    kubelet_identity = module.aks.kubelet_identity_id
  }
  role_definitions = {
    acr_pull_role = {
      name = "AcrPull"
    }
  }
  role_assignments_for_scopes = {
    acr_role_assignments = {
      scope = data.azurerm_container_registry.core[each.key].resource_id
      role_assignments = {
        role_assignment_1 = {
          role_definition                  = "acr_pull_role"
          user_assigned_managed_identities = ["kubelet_identity"]
        }
      }
    }
  }
  depends_on = [module.aks]
}

module "iam_aks_acr_shared" {
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "0.3.0"

  for_each = toset(var.acr_shared)

  user_assigned_managed_identities_by_principal_id = {
    kubelet_identity = module.aks.kubelet_identity_id
  }
  role_definitions = {
    acr_pull_role = {
      name = "AcrPull"
    }
  }
  role_assignments_for_scopes = {
    acr_role_assignments = {
      scope = data.azurerm_container_registry.shared[each.key].resource_id
      role_assignments = {
        role_assignment_1 = {
          role_definition                  = "acr_pull_role"
          user_assigned_managed_identities = ["kubelet_identity"]
        }
      }
    }
  }
  depends_on = [module.aks]
}


# #tfsec:ignore:AZU007
# #tfsec:ignore:AZU008
# #tfsec:ignore:AZU009
# #tfsec:ignore:GEN001
# module "aks" {
#   source  = "Azure/aks/azurerm"
#   version = "11.0.0"
#   # source = "git://github.com/Azure/terraform-azurerm-aks.git?ref=master"

#   cluster_name              = local.service_name
#   prefix                    = local.service_name
#   resource_group_name       = azurerm_resource_group.aks.name
#   location                  = azurerm_resource_group.aks.location
#   kubernetes_version        = var.kubernetes_version
#   orchestrator_version      = var.kubernetes_version
#   automatic_channel_upgrade = var.automatic_channel_upgrade

#   sku_tier = var.sku

#   vnet_subnet = {
#     id = data.azurerm_subnet.aks.id
#   }

#   private_cluster_enabled = var.private_cluster_enabled

#   network_plugin = var.network_plugin
#   network_policy = var.network_policy

#   # net_profile_pod_cidr           = var.net_profile_pod_cidr
#   net_profile_service_cidr   = var.net_profile_service_cidr
#   net_profile_dns_service_ip = var.net_profile_dns_service_ip

#   public_ssh_key = var.public_ssh_key

#   role_based_access_control_enabled = true
#   rbac_aad_azure_rbac_enabled       = true
#   # rbac_aad_admin_group_object_ids  = var.admin_group_object_ids

#   # enable_log_analytics_workspace  = false

#   azure_policy_enabled = var.azure_policy_enabled

#   open_service_mesh_enabled = var.open_service_mesh_enabled

#   key_vault_secrets_provider_enabled = var.key_vault_secrets_provider_enabled
#   secret_rotation_enabled            = var.secret_rotation_enabled

#   workload_identity_enabled = var.workload_identity_enabled
#   oidc_issuer_enabled       = var.oidc_issuer_enabled

#   identity_type = "UserAssigned"
#   identity_ids  = [azurerm_user_assigned_identity.aks_identity.id]

#   os_disk_size_gb           = var.os_disk_size_gb
#   agents_min_count          = var.agents_min_count
#   agents_max_count          = var.agents_max_count
#   agents_count              = var.agents_count
#   agents_max_pods           = var.agents_max_pods
#   agents_pool_name          = var.agents_pool_name
#   agents_availability_zones = var.agents_availability_zones
#   agents_type               = var.agents_type
#   agents_size               = var.agents_size
#   agents_labels             = var.agents_labels
#   agents_tags               = var.agents_tags

#   maintenance_window = var.maintenance_window

#   api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges

#   # TODO: AKS: Another node pools
#   # labels: kind/feature, priority/high, lifecycle/frozen, area/terraform, cloud/azure
#   # https://github.com/Azure/terraform-azurerm-aks/pull/127
#   # node_pools = var.node_pools

#   tags = var.tags

#   node_pools = var.node_pools

#   depends_on = [
#     azurerm_resource_group.aks
#   ]
# }
