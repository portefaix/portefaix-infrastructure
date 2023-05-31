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

data "oci_core_vcns" "this" {
  compartment_id = var.compartment_id
  display_name   = var.vcn_name
}

data "oci_core_route_tables" "ig" {
  compartment_id = var.compartment_id
  display_name   = var.ig_route_table_name
  vcn_id         = data.oci_core_vcns.this[0].id
}

data "oci_core_route_tables" "ng" {
  compartment_id = var.compartment_id
  display_name   = var.ng_route_table_name
  vcn_id         = data.oci_core_vcns.this[0].id
}