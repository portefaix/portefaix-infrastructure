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

############################################################################
# Provider

subscription_network_id = "719259e8-1fae-4da0-ab76-1880c938c756"

############################################################################
# VNet

organization = "portefaix"

resource_group_location = "West Europe"

address_space = ["10.10.0.0/16"]

subnets = {}

tags = {
  "env"               = "network"
  "service"           = "hub"
  "project"           = "portefaix"
  "made-by"           = "terraform"
  "portefaix-version" = "v0.43.0"
}
