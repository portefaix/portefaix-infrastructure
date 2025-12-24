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

output "vcn_id" {
  description = "The OCID of the VCN"
  value       = module.vcn.vcn_id
}

output "public_subnet_ids" {
  description = "The OCIDs of the public subnets"
  value       = module.vcn.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The OCIDs of the private subnets"
  value       = module.vcn.private_subnet_ids
}

output "nat_gateway_id" {
  description = "The OCID of the NAT gateway"
  value       = module.vcn.nat_gateway_id
}

output "internet_gateway_id" {
  description = "The OCID of the internet gateway"
  value       = module.vcn.internet_gateway_id
}

output "service_gateway_id" {
  description = "The OCID of the service gateway"
  value       = module.vcn.service_gateway_id
}
