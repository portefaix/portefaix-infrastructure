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

module "hub_spoke_network" {
  source = "github.com/oci-landing-zones/terraform-oci-modules-networking?ref=v0.7.8"

  tenancy_ocid = var.tenancy_ocid

  network_configuration = {
    default_compartment_id     = var.hub_compartment_id
    default_enable_cis_checks  = false
    default_freeform_tags      = var.freeform_tags
    default_ssh_ports_to_check = []

    network_configuration_categories = {
      hub_spoke = {
        vcns = var.vcns

        subnets = merge(
          var.hub_subnets,
          var.dev_subnets,
          var.staging_subnets,
          var.prod_subnets
        )

        security_lists = merge(
          var.hub_security_lists,
          var.dev_security_lists,
          var.staging_security_lists,
          var.prod_security_lists
        )

        route_tables = merge(
          var.hub_route_tables,
          var.dev_route_tables,
          var.staging_route_tables,
          var.prod_route_tables
        )

        vcn_specific_gateways = var.vcn_gateways

        non_vcn_specific_gateways = var.drg_config
      }
    }
  }
}
