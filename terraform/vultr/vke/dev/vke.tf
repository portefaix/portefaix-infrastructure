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

module "kubernetes" {
  source = "../modules/vke"

  region             = var.region
  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version

  node_quantity = var.node_quantity
  node_plan     = var.node_plan
  node_label    = var.node_label

  node_pools = var.node_pools
}
