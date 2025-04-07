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
  vcn_name                  = format("%s-core-%s", var.organization, var.environment)
  internet_gateway_name     = format("%s-core-%s", var.organization, var.environment)
  nat_gateway_name          = format("%s-core-%s", var.organization, var.environment)
  service_gateway_name      = format("%s-core-%s", var.organization, var.environment)
  control_plane_subnet_name = format("%s-control-plane", local.vcn_name)
  workers_subnet_name       = format("%s-workers", local.vcn_name)
  pub_lb_subnet_name        = format("%s-pub-lb", local.vcn_name)
  int_lb_subnet_name        = format("%s-int-lb", local.vcn_name)
}
