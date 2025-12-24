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

  tenancy_ocid                     = var.tenancy_ocid
  hub_compartment_id               = var.hub_compartment_id
  network_configuration_categories = var.network_configuration_categories

  freeform_tags = var.freeform_tags
}
