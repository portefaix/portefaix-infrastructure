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

module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.5.4"

  compartment_id = var.compartment_id

  label_prefix = "none"

  vcn_name  = local.vcn_name
  vcn_cidrs = var.vcn_cidrs

  create_internet_gateway       = var.create_internet_gateway
  internet_gateway_display_name = local.internet_gateway_name

  create_nat_gateway       = var.create_nat_gateway
  nat_gateway_display_name = local.nat_gateway_name

  create_service_gateway       = var.create_service_gateway
  service_gateway_display_name = local.service_gateway_name

  freeform_tags = var.freeform_tags
}
