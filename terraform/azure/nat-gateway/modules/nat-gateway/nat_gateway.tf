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

module "nat_gateway" {
  source  = "Azure/avm-res-network-natgateway/azurerm"
  version = "0.2.1"

  name                = local.service_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  enable_telemetry = false

  public_ips = {
    public_ip_1 = {
      name = module.public_ip_address.resource_id
    }
  }

  subnet_associations = {
    subnet_1 = {
      resource_id = azurerm_subnet.this.id
    }
  }
}
