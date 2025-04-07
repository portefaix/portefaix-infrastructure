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

# Copyright (C) 2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>
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

module "oke" {
  source  = "oracle-terraform-modules/oke/oci"
  version = "5.0.0"

  providers = {
    oci.home = oci.home
  }

  compartment_id = var.compartment_id
  region         = var.region
  home_region    = var.region

  vcn_id = var.vcn_id

  # Cluster
  cluster_name                 = local.cluster_name
  kubernetes_version           = var.kubernetes_version
  control_plane_type           = "private"
  pods_cidr                    = var.pods_cidr
  services_cidr                = var.services_cidr
  allow_worker_internet_access = var.allow_worker_internet_access
  allow_pod_internet_access    = var.allow_pod_internet_access
  allow_worker_ssh_access      = var.allow_worker_ssh_access
  control_plane_allowed_cidrs  = var.control_plane_allowed_cidrs
  control_plane_is_public      = var.control_plane_is_public
  control_plane_nsg_ids        = var.control_plane_nsg_ids
  cni_type                     = var.cni_type

  load_balancers          = var.load_balancers
  preferred_load_balancer = var.preferred_load_balancer

  enable_waf = var.enable_waf

  # Network configuration
  subnets = {
    node_pool     = var.node_subnet_id
    load_balancer = var.lb_subnet_id
  }

  # Node pool configuration
  node_pools = var.node_pools

  # Bastion configuration
  create_bastion    = false
  bastion_public_ip = var.bastion_public_ip

  # Other configurations
  cluster_options = {
    kubernetes_network_config = {
      pods_cidr     = var.pods_cidr
      services_cidr = var.services_cidr
    }
    add_ons = {
      dashboard = true
      tiller    = false
    }
  }

  # worker_pools              = var.worker_pools
  # worker_pool_mode          = var.worker_pool_mode
  # worker_pool_size          = var.worker_pool_size
  # worker_image_os           = var.worker_image_os
  # worker_image_os_version   = var.worker_image_os_version
  # worker_shape              = var.worker_shape
  # worker_node_labels        = var.worker_node_labels
  # worker_node_metadata      = var.worker_node_metadata
  # worker_preemptible_config = var.worker_preemptible_config

  # timezone = var.timezone

  freeform_tags = var.freeform_tags
}
