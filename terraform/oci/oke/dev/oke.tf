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

module "oke" {
  source = "../modules/oke"

  providers = {
    oci      = oci
    oci.home = oci.home
  }

  region         = var.region
  compartment_id = var.compartment_id
  organization   = var.organization
  environment    = var.environment

  pods_cidr     = var.pods_cidr
  services_cidr = var.services_cidr

  worker_pools              = var.worker_pools
  worker_pool_mode          = var.worker_pool_mode
  worker_pool_size          = var.worker_pool_size
  worker_image_os           = var.worker_image_os
  worker_image_os_version   = var.worker_image_os_version
  worker_shape              = var.worker_shape
  worker_node_labels        = var.worker_node_labels
  worker_node_metadata      = var.worker_node_metadata
  worker_preemptible_config = var.worker_preemptible_config

  freeform_tags = var.freeform_tags
}
