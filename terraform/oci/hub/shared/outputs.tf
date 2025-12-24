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
# Hub and Spoke Network Outputs
#############################################################################

# VCN Outputs
output "hub_vcn_id" {
  description = "Hub VCN ID"
  value       = module.hub.vcns["HUB-VCN"].id
}

output "spoke_dev_vcn_id" {
  description = "Core Dev Spoke VCN ID"
  value       = module.hub.vcns["SPOKE-DEV-VCN"].id
}

output "spoke_staging_vcn_id" {
  description = "Core Staging Spoke VCN ID"
  value       = module.hub.vcns["SPOKE-STAGING-VCN"].id
}

output "spoke_prod_vcn_id" {
  description = "Core Prod Spoke VCN ID"
  value       = module.hub.vcns["SPOKE-PROD-VCN"].id
}

# DRG Output
output "drg_id" {
  description = "Dynamic Routing Gateway ID"
  value       = module.hub.dynamic_routing_gateways["HUB-DRG"].id
}

# Subnet Outputs for OKE - Dev
output "dev_oke_api_subnet_id" {
  description = "Dev OKE API Endpoint Subnet ID"
  value       = module.hub.subnets["SPOKE-DEV-SUBNET-OKE-API"].id
}

output "dev_oke_nodes_subnet_id" {
  description = "Dev OKE Worker Nodes Subnet ID"
  value       = module.hub.subnets["SPOKE-DEV-SUBNET-OKE-NODES"].id
}

output "dev_oke_lb_subnet_id" {
  description = "Dev OKE Load Balancer Subnet ID"
  value       = module.hub.subnets["SPOKE-DEV-SUBNET-OKE-LB"].id
}

# Subnet Outputs for OKE - Staging
output "staging_oke_api_subnet_id" {
  description = "Staging OKE API Endpoint Subnet ID"
  value       = module.hub.subnets["SPOKE-STAGING-SUBNET-OKE-API"].id
}

output "staging_oke_nodes_subnet_id" {
  description = "Staging OKE Worker Nodes Subnet ID"
  value       = module.hub.subnets["SPOKE-STAGING-SUBNET-OKE-NODES"].id
}

output "staging_oke_lb_subnet_id" {
  description = "Staging OKE Load Balancer Subnet ID"
  value       = module.hub.subnets["SPOKE-STAGING-SUBNET-OKE-LB"].id
}

# Subnet Outputs for OKE - Prod
output "prod_oke_api_subnet_id" {
  description = "Prod OKE API Endpoint Subnet ID"
  value       = module.hub.subnets["SPOKE-PROD-SUBNET-OKE-API"].id
}

output "prod_oke_nodes_subnet_id" {
  description = "Prod OKE Worker Nodes Subnet ID"
  value       = module.hub.subnets["SPOKE-PROD-SUBNET-OKE-NODES"].id
}

output "prod_oke_lb_subnet_id" {
  description = "Prod OKE Load Balancer Subnet ID"
  value       = module.hub.subnets["SPOKE-PROD-SUBNET-OKE-LB"].id
}

# Gateway Outputs
output "hub_internet_gateway_id" {
  description = "Hub Internet Gateway ID"
  value       = module.hub.internet_gateways["HUB-INET-GW"].id
}

output "hub_nat_gateway_id" {
  description = "Hub NAT Gateway ID"
  value       = module.hub.nat_gateways["HUB-NAT-GW"].id
}

output "hub_service_gateway_id" {
  description = "Hub Service Gateway ID"
  value       = module.hub.service_gateways["HUB-SGW"].id
}

# Network Summary
output "network_summary" {
  description = "Hub and Spoke Network Summary"
  value = {
    hub_vcn = {
      id          = module.hub.vcns["HUB-VCN"].id
      cidr_blocks = module.hub.vcns["HUB-VCN"].cidr_blocks
    }
    spokes = {
      dev = {
        vcn_id      = module.hub.vcns["SPOKE-DEV-VCN"].id
        cidr_blocks = module.hub.vcns["SPOKE-DEV-VCN"].cidr_blocks
      }
      staging = {
        vcn_id      = module.hub.vcns["SPOKE-STAGING-VCN"].id
        cidr_blocks = module.hub.vcns["SPOKE-STAGING-VCN"].cidr_blocks
      }
      prod = {
        vcn_id      = module.hub.vcns["SPOKE-PROD-VCN"].id
        cidr_blocks = module.hub.vcns["SPOKE-PROD-VCN"].cidr_blocks
      }
    }
    drg_id = module.hub.dynamic_routing_gateways["HUB-DRG"].id
  }
}
