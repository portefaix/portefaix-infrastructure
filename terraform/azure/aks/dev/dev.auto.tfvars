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

#############################################################################
# Provider

subscription_core_dev_id = "b7ff400c-0b01-4a49-af59-f179d610026a"

#############################################################################
# Networking

vnet_resource_group_name = "portefaix-core-dev-vnet"
virtual_network_name     = "portefaix-core-dev"
aks_subnet_name          = "portefaix-core-dev-aks"
appgw_subnet_name        = "ApplicationGatewaySubnet" #"portefaix-dev-appgw"

#############################################################################
# Active Directory

# aad_group_name = "portefaix-dev-aks"

#############################################################################
# AKS

organization = "portefaix"
environment  = "dev"

resource_group_location = "West Europe"

# cluster_name       = "portefaix-dev-aks"
# prefix             = "portefaix-dev-aks"
kubernetes_version = "1.26.3"

private_cluster_enabled = false

# rbac = true
# pod_security_policy = false

tags = {
  "env"               = "dev"
  "project"           = "portefaix"
  "service"           = "kubernetes"
  "made-by"           = "terraform"
  "portefaix-version" = "v0.43.0"
}

#############################################################################
# Network profile

network_plugin = "azure"
network_policy = "calico"

# net_profile_pod_cidr           = "10.0.16.0/20"
net_profile_service_cidr   = "10.0.16.0/20"
net_profile_dns_service_ip = "10.0.16.10"

#############################################################################
# Addon profile

http_application_routing_enabled = false
# enable_kube_dashboard           = false
azure_policy_enabled = false
# aci_connector_linux             = false

#############################################################################
# Node pools

agents_pool_name          = "core"
agents_count              = 2
agents_size               = "Standard_D2s_v3"
os_disk_size_gb           = 50
enable_auto_scaling       = true
agents_min_count          = 1
agents_max_count          = 4
agents_availability_zones = [1, 2, 3]
agents_type               = "VirtualMachineScaleSets"
agents_max_pods           = 110

agents_labels = {
  "project"  = "portefaix"
  "env"      = "dev"
  "service"  = "kubernetes"
  "nodepool" = "core"
  "made-by"  = "terraform"
}

agents_tags = {
  "env"      = "dev"
  "project"  = "portefaix"
  "service"  = "kubernetes"
  "nodepool" = "core"
  "made-by"  = "terraform"
}

# node_pools = [
#   {
#     name                = "ops"
#     vm_size             = "Standard_D2s_v3"
#     os_disk_size_gb     = 50
#     os_disk_type        = "Managed"
#     priority            = "Spot"
#     enable_auto_scaling = true
#     count               = 0
#     min_count           = 0
#     max_count           = 4
#     max_pods            = 110
#     workload_runtime    = "OCIContainer"
#     labels = {
#       "project"  = "portefaix"
#       "env"      = "dev"
#       "service"  = "kubernetes"
#       "nodepool" = "ops"
#       "made-by"  = "terraform"
#     },
#     taints = [
#       "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"
#     ],
#     tags = {
#       "env"      = "dev"
#       "project"  = "portefaix"
#       "service"  = "kubernetes"
#       "nodepool" = "ops"
#       "made-by"  = "terraform"
#     }
#   },
#   {
#     name                = "wasi"
#     vm_size             = "Standard_D2s_v3"
#     os_disk_size_gb     = 50
#     os_disk_type        = "Managed"
#     priority            = "Spot"
#     enable_auto_scaling = true
#     count               = 0
#     min_count           = 0
#     max_count           = 4
#     max_pods            = 110
#     workload_runtime    = "WasmWasi"
#     labels = {
#       "project"  = "portefaix"
#       "env"      = "dev"
#       "service"  = "kubernetes"
#       "nodepool" = "wasi"
#       "made-by"  = "terraform"
#     },
#     taints = [
#       "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"
#     ],
#     tags = {
#       "env"      = "dev"
#       "project"  = "portefaix"
#       "service"  = "kubernetes"
#       "nodepool" = "wasi"
#       "made-by"  = "terraform"
#     }
#   }
# ]

node_pools = {
  "ops" = {
    name                = "ops"
    vm_size             = "Standard_D2s_v3"
    os_disk_size_gb     = 50
    os_disk_type        = "Managed"
    priority            = "Spot"
    enable_auto_scaling = true
    count               = 0
    min_count           = 0
    max_count           = 4
    max_pods            = 110
    workload_runtime    = "OCIContainer"
    labels = {
      "project"  = "portefaix"
      "env"      = "dev"
      "service"  = "kubernetes"
      "nodepool" = "ops"
      "made-by"  = "terraform"
    },
    taints = [
      "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"
    ],
    tags = {
      "env"      = "dev"
      "project"  = "portefaix"
      "service"  = "kubernetes"
      "nodepool" = "ops"
      "made-by"  = "terraform"
    }
  },
  "wasi" = {
    name                = "wasi"
    vm_size             = "Standard_D2s_v3"
    os_disk_size_gb     = 50
    os_disk_type        = "Managed"
    priority            = "Spot"
    enable_auto_scaling = true
    count               = 0
    min_count           = 0
    max_count           = 4
    max_pods            = 110
    workload_runtime    = "WasmWasi"
    labels = {
      "project"  = "portefaix"
      "env"      = "dev"
      "service"  = "kubernetes"
      "nodepool" = "wasi"
      "made-by"  = "terraform"
    },
    taints = [
      "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"
    ],
    tags = {
      "env"      = "dev"
      "project"  = "portefaix"
      "service"  = "kubernetes"
      "nodepool" = "wasi"
      "made-by"  = "terraform"
    }
  }
}

#############################################################################
# ACR

acr_core = [
  "portefaixdevacrcharts",
  "portefaixdevacrcontainers"
]

acr_shared = [
  "portefaixsharedacrcharts"
]
