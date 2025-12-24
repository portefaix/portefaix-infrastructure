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
        vcns = {
          # Hub VCN with nested subnets, security lists, route tables, and gateways
          for vcn_key, vcn_config in var.vcns : vcn_key => merge(
            vcn_config,
            {
              subnets = vcn_key == "HUB-VCN" ? var.hub_subnets : (
                vcn_key == "SPOKE-DEV-VCN" ? var.dev_subnets : (
                  vcn_key == "SPOKE-STAGING-VCN" ? var.staging_subnets : (
                    vcn_key == "SPOKE-PROD-VCN" ? var.prod_subnets : {}
                  )
                )
              )

              security_lists = vcn_key == "HUB-VCN" ? var.hub_security_lists : (
                vcn_key == "SPOKE-DEV-VCN" ? var.dev_security_lists : (
                  vcn_key == "SPOKE-STAGING-VCN" ? var.staging_security_lists : (
                    vcn_key == "SPOKE-PROD-VCN" ? var.prod_security_lists : {}
                  )
                )
              )

              route_tables = vcn_key == "HUB-VCN" ? var.hub_route_tables : (
                vcn_key == "SPOKE-DEV-VCN" ? var.dev_route_tables : (
                  vcn_key == "SPOKE-STAGING-VCN" ? var.staging_route_tables : (
                    vcn_key == "SPOKE-PROD-VCN" ? var.prod_route_tables : {}
                  )
                )
              )

              vcn_specific_gateways = {
                internet_gateways = {
                  for gw_key, gw_config in lookup(var.vcn_gateways, "internet_gateways", {}) :
                  gw_key => gw_config if gw_config.vcn_id == vcn_key
                }

                nat_gateways = {
                  for gw_key, gw_config in lookup(var.vcn_gateways, "nat_gateways", {}) :
                  gw_key => gw_config if gw_config.vcn_id == vcn_key
                }

                service_gateways = {
                  for gw_key, gw_config in lookup(var.vcn_gateways, "service_gateways", {}) :
                  gw_key => gw_config if gw_config.vcn_id == vcn_key
                }
              }
            }
          )
        }

        non_vcn_specific_gateways = var.drg_config
      }
    }
  }
}
