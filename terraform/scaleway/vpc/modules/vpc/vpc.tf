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

resource "scaleway_vpc_private_network" "this" {
  name = var.name
  tags = var.tags
}

resource "scaleway_vpc_private_network" "kapsule" {
  name = format("%s-kapsule", var.name)
  tags = concat(var.tags, ["kapsule"])
}

resource "scaleway_vpc_public_gateway_dhcp" "this" {
  subnet = "192.168.1.0/24"
}

resource "scaleway_vpc_public_gateway" "this" {
  name  = var.name
  ip_id = data.scaleway_vpc_public_gateway_ip.this.id
  type  = var.type
  tags  = var.tags
}
