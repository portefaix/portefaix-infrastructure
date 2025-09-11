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
  source = "../modules/aks"

  organization = var.organization
  environment  = var.environment

  virtual_network_name     = var.virtual_network_name
  vnet_resource_group_name = var.vnet_resource_group_name
  aks_subnet_name          = var.aks_subnet_name
  appgw_subnet_name        = var.appgw_subnet_name

  resource_group_location = var.resource_group_location
  kubernetes_version      = var.kubernetes_version
  authorized_ip_ranges    = var.authorized_ip_ranges

  default_node_pool = var.default_node_pool

  tags = var.tags

  acr_core   = var.acr_core
  acr_shared = var.acr_shared
}
