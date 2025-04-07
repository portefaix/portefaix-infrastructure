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

output "hub_vcn_id" {
  description = "ID du VCN Hub"
  value       = module.hub_vcn.vcn_id
}

output "hub_drg_id" {
  description = "ID du DRG"
  value       = oci_core_drg.hub_drg.id
}

output "hub_public_subnet_id" {
  description = "ID du sous-réseau public du Hub"
  value       = oci_core_subnet.hub_public_subnet.id
}

output "hub_private_subnet_id" {
  description = "ID du sous-réseau privé du Hub"
  value       = oci_core_subnet.hub_private_subnet.id
}

output "hub_internet_gateway_id" {
  description = "ID de la passerelle Internet du Hub"
  value       = module.hub_vcn.internet_gateway_id
}

output "hub_nat_gateway_id" {
  description = "ID de la passerelle NAT du Hub"
  value       = module.hub_vcn.nat_gateway_id
}

output "hub_service_gateway_id" {
  description = "ID de la passerelle de service du Hub"
  value       = module.hub_vcn.service_gateway_id
}
