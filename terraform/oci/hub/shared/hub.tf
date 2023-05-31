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

module "hub" {
  source = "../modules/hub"

  compartment_id = var.compartment_id

  organization = var.organization
  vcn_name     = var.vcn_name
  vcn_cidrs    = var.vcn_cidrs

  create_internet_gateway       = var.create_internet_gateway
  internet_gateway_display_name = var.internet_gateway_display_name

  create_nat_gateway       = var.create_nat_gateway
  nat_gateway_display_name = var.nat_gateway_display_name

  create_service_gateway       = var.create_service_gateway
  service_gateway_display_name = var.service_gateway_display_name

  mgmt_cidr = var.mgmt_cidr

  # nat_gateway_public_ip_id = var.nat_gateway_public_ip_id

  # local_peering_gateways = {
  #   to_spoke1 = { # LPG will be in acceptor mode with a route table attached
  #     route_table_id = oci_core_route_table.VTR_spokes.id
  #   }
  #   to_spoke2 = { # LPG will be in requestor mode with no route table attached
  #     route_table_id = oci_core_route_table.VTR_spokes.id
  #     peer_id        = module.vcn_spoke2.lpg_all_attributes["to_hub"]["id"]
  #   }
  #   to_spoke3 = {} # LPG will be in acceptor mode with no route table attached
  # }

  # # routing rules
  # internet_gateway_route_rules = var.internet_gateway_route_rules # this module input shows how to pass routing information to the vcn module through  Variable Input. Can be initialized in a *.tfvars or *.auto.tfvars file

  freeform_tags = var.freeform_tags
}
