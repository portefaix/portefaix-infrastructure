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

locals {
  description = format("%s SKS cluster", var.name)
  sg_name     = var.name
}

resource "exoscale_sks_cluster" "cluster" {
  name        = var.name
  description = local.description
  zone        = var.zone

  service_level = var.service_level

  version = var.kubernetes_version

  cni            = var.cni
  exoscale_ccm   = var.exoscale_ccm
  metrics_server = var.metrics_server
  auto_upgrade   = var.auto_upgrade
}

resource "exoscale_security_group" "this" {
  name = local.sg_name

  depends_on = [
    exoscale_sks_cluster.cluster
  ]
}

resource "exoscale_security_group_rule" "logs_rule" {
  security_group_id = exoscale_security_group.this.id
  type              = "INGRESS"
  protocol          = "TCP"
  cidr              = "0.0.0.0/0"
  start_port        = 10250
  end_port          = 10250
}

resource "exoscale_security_group_rule" "calico" {
  security_group_id      = exoscale_security_group.this.id
  user_security_group_id = exoscale_security_group.this.id
  type                   = "INGRESS"
  protocol               = "UDP"
  start_port             = 4789
  end_port               = 4789
}

resource "exoscale_security_group_rule" "ccm" {
  security_group_id = exoscale_security_group.this.id
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 30000
  end_port          = 32767
  cidr              = "0.0.0.0/0"
}

resource "exoscale_sks_nodepool" "core" {
  count = length(var.node_pools)

  zone          = var.zone
  cluster_id    = exoscale_sks_cluster.cluster.id
  name          = var.node_pools[count.index].name
  instance_type = var.node_pools[count.index].instance_type
  size          = var.node_pools[count.index].size

  security_group_ids = [exoscale_security_group.this.id]
}
