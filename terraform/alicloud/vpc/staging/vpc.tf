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

module "vpc" {
  source = "../modules/vpc"

  region             = var.region
  vpc_name           = var.vpc_name
  vpc_subnet_cidr    = var.vpc_subnet_cidr
  vswitch_name       = var.vswitch_name
  vswitch_cidrs      = var.vswitch_cidrs
  availability_zones = var.availability_zones
  vpc_tags           = var.vpc_tags
  vswitch_tags       = var.vswitch_tags

  pod_vswitch_name  = var.pod_vswitch_name
  pod_vswitch_cidrs = var.pod_vswitch_cidrs
  pod_vswitch_tags  = var.pod_vswitch_tags
}
