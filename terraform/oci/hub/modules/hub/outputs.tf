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
# Hub and Spoke Network Module Outputs
#
# These outputs expose all resources created by the OCI Landing Zones
# networking module for consumption by the parent module.
#############################################################################

# VCNs
output "vcns" {
  description = "Map of all VCNs created"
  value       = module.hub_spoke_network.vcns
}

# Subnets
output "subnets" {
  description = "Map of all subnets created"
  value       = module.hub_spoke_network.subnets
}

# Security Lists
output "security_lists" {
  description = "Map of all security lists created"
  value       = module.hub_spoke_network.security_lists
}

# Route Tables
output "route_tables" {
  description = "Map of all route tables created"
  value       = module.hub_spoke_network.route_tables
}

# Internet Gateways
output "internet_gateways" {
  description = "Map of all internet gateways created"
  value       = module.hub_spoke_network.internet_gateways
}

# NAT Gateways
output "nat_gateways" {
  description = "Map of all NAT gateways created"
  value       = module.hub_spoke_network.nat_gateways
}

# Service Gateways
output "service_gateways" {
  description = "Map of all service gateways created"
  value       = module.hub_spoke_network.service_gateways
}

# Dynamic Routing Gateways
output "dynamic_routing_gateways" {
  description = "Map of all DRGs created"
  value       = module.hub_spoke_network.dynamic_routing_gateways
}

# DRG Attachments
output "drg_attachments" {
  description = "Map of all DRG attachments created"
  value       = module.hub_spoke_network.drg_attachments
}

# DRG Route Tables
output "drg_route_tables" {
  description = "Map of all DRG route tables created"
  value       = module.hub_spoke_network.drg_route_tables
}

# Complete module output for advanced use cases
output "network_module" {
  description = "Complete output from the OCI Landing Zones networking module"
  value       = module.hub_spoke_network
  sensitive   = false
}
