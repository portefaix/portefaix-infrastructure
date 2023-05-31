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

  label_prefix = var.label_prefix

  vcn_name  = var.vcn_name
  vcn_cidrs = var.vcn_cidrs

  freeform_tags = var.freeform_tags
}
