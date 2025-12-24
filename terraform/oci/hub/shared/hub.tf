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
# Hub and Spoke Network Architecture
#
# This file instantiates the hub module with the network configuration
# defined in locals.tf.
#############################################################################

module "hub" {
  source = "../modules/hub"

  vcns = var.vcns

  hub_compartment_id = var.hub_compartment_id
  hub_subnets        = var.hub_subnets
  hub_security_lists = var.hub_security_lists
  hub_route_tables   = var.hub_route_tables

  dev_subnets        = var.dev_subnets
  dev_security_lists = var.dev_security_lists
  dev_route_tables   = var.dev_route_tables

  staging_subnets        = var.staging_subnets
  staging_security_lists = var.staging_security_lists
  staging_route_tables   = var.staging_route_tables

  prod_subnets        = var.prod_subnets
  prod_security_lists = var.prod_security_lists
  prod_route_tables   = var.prod_route_tables

  vcn_gateways = var.vcn_gateways
  drg_config   = var.drg_config
}
