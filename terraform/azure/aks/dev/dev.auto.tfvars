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

kubernetes_version = "1.26.3"

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
# Node pools

default_node_pool = {
  name                 = "core"
  vm_size              = "Standard_DS2_v2"
  node_count           = 3
  min_count            = 3
  max_count            = 3
  auto_scaling_enabled = true
  upgrade_settings = {
    max_surge = "10%"
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
