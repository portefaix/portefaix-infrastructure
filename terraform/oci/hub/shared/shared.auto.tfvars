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

#####################################################################""
# Provider

region = "uk-london-1"


##############################################################################
# Hub

organization   = "portefaix"
compartment_id = "ocid1.compartment.oc1..aaaaaaaac25tc3pu3lrlfij2jhnwrl74cvwhx5onoin53ckxylbqecb537ca"

vcn_name                      = "hub"
vcn_cidrs                     = ["10.10.0.0/16"]
internet_gateway_display_name = "hub"
nat_gateway_display_name      = "hub"
service_gateway_display_name  = "hub"

mgmt_cidr = "10.10.0.0/24"

freeform_tags = {
  project = "hub"
  env     = "shared"
  made-by = "terraform"
}
