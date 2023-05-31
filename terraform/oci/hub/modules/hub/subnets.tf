

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

resource "oci_core_subnet" "mgmt" {
  cidr_block                 = var.mgmt_cidr
  compartment_id             = var.compartment_id
  display_name               = format("%s-mgmt", var.organization)
  dns_label                  = "cp"
  prohibit_public_ip_on_vnic = true
  vcn_id                     = module.hub.vcn_id
  route_table_id             = module.hub.ig_route_id
  # security_list_ids          = [oci_core_security_list.mgmt.id]
}
