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
  source = "../modules/vcn"

  region         = var.region
  compartment_id = var.compartment_id
  organization   = var.organization
  environment    = var.environment

  create_internet_gateway = var.create_internet_gateway
  create_nat_gateway      = var.create_nat_gateway
  create_service_gateway  = var.create_service_gateway

  vcn_cidrs = var.vcn_cidrs
  # control_plane_cidr = var.control_plane_cidr
  # workers_cidr       = var.workers_cidr
  # pub_lb_cidr        = var.pub_lb_cidr
  # int_lb_cidr        = var.int_lb_cidr

  freeform_tags = var.freeform_tags
}
