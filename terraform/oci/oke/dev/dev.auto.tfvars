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
# OKE

organization   = "portefaix"
environment    = "dev"
compartment_id = "ocid1.compartment.oc1..aaaaaaaas7v6jey7zd67kotets3qk4oi6ile3dbkajpuh7xgye7nzr6lp6hq"

vcn_name             = "portefaix-core-dev"
ig_route_table_name  = "internet-route" # "portefaix-core-dev-nat-route"
nat_route_table_name = "portefaix-core-dev-internet-route"

kubernetes_version = "v1.21.5"

pods_cidr     = "10.244.0.0/16"
services_cidr = "10.96.0.0/16"

control_plane_cidr = "10.20.00.0/24"
workers_cidr       = "10.20.10.0/24"
pub_lb_cidr        = "10.20.20.0/24"
int_lb_cidr        = "10.20.30.0/24"

worker_node_labels = {
  project = "core"
  env     = "dev"
}

worker_pools = {
  core = {
    mode             = "node-pool",
    description      = "Core"
    shape            = "VM.Standard.A1.Flex",
    os               = "Oracle Linux",
    os_version       = "8",
    ocpus            = 1,
    memory           = 6,
    autoscale        = true,
    size             = 1,
    size_max         = 3,
    boot_volume_size = 50,
    label = {
      node-pool = "core",
    }
  }
  ops = {
    mode             = "node-pool",
    description      = "Operations"
    shape            = "VM.Standard.A1.Flex",
    os               = "Oracle Linux",
    os_version       = "8",
    ocpus            = 1,
    memory           = 6,
    autoscale        = true,
    size             = 0,
    size_max         = 3,
    boot_volume_size = 50
    label = {
      node-pool = "ops"
    }
  }
}

enable_waf = true

freeform_tags = {
  # vcn      = {}
  # bastion  = {}
  # operator = {}
  # cluster = {
  #   cluster = {
  #     project = "core"
  #     env     = "dev"
  #     service = "kubernetes"
  #     made-by = "terraform"
  #   }
  #   service_lb = {
  #     project = "core"
  #     env     = "dev"
  #     service = "kubernetes"
  #     made-by = "terraform"
  #   }
  #   persistent_volume = {
  #     project = "core"
  #     env     = "dev"
  #     service = "kubernetes"
  #     made-by = "terraform"
  #   }
  # }
  # workers           = {
  #   project = "core"
  #   env     = "dev"
  #   service = "kubernetes"
  #   made-by = "terraform"
  # }
  # network            = {}
  # policy            = {}
}
