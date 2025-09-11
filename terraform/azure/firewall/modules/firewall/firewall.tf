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

module "firewall_policy" {
  source  = "Azure/avm-res-network-firewallpolicy/azurerm"
  version = "0.3.3"

  name                = format("%s-core", local.service_name)
  location            = data.azurerm_resource_group.hub.location
  resource_group_name = data.azurerm_resource_group.hub.name
}

module "azure_firewall" {
  source  = "Azure/avm-res-network-azurefirewall/azurerm"
  version = "0.4.0"

  name                = format("%s-core", local.service_name)
  location            = data.azurerm_resource_group.hub.location
  resource_group_name = data.azurerm_resource_group.hub.name

  firewall_sku_name = "AZFW_VNet"
  firewall_sku_tier = var.sku

  enable_telemetry = false
  firewall_zones   = ["1", "2", "3"]

  ip_configurations = {
    default = {
      name                 = "ipconfig1"
      subnet_id            = azurerm_subnet.this.id
      public_ip_address_id = module.public_ip_address.public_ip_id
    }
  }

  tags = var.tags
}



resource "azurerm_firewall_network_rule_collection" "time" {
  name                = format("%s-time", local.service_name)
  azure_firewall_name = module.azure_firewall.resource_id
  resource_group_name = data.azurerm_resource_group.hub.name
  priority            = 101
  action              = "Allow"

  rule {
    description           = "aks node time sync rule"
    name                  = "allow network"
    source_addresses      = ["*"]
    destination_ports     = ["123"]
    destination_addresses = ["*"]
    protocols             = ["UDP"]
  }
}

resource "azurerm_firewall_network_rule_collection" "dns" {
  name                = format("%s-dns", local.service_name)
  azure_firewall_name = module.azure_firewall.resource_id
  resource_group_name = data.azurerm_resource_group.hub.name
  priority            = 102
  action              = "Allow"

  rule {
    description           = "aks node dns rule"
    name                  = "allow network"
    source_addresses      = ["*"]
    destination_ports     = ["53"]
    destination_addresses = ["*"]
    protocols             = ["UDP"]
  }
}

resource "azurerm_firewall_network_rule_collection" "servicetags" {
  name                = format("%s-servicetags", local.service_name)
  azure_firewall_name = module.azure_firewall.resource_id
  resource_group_name = data.azurerm_resource_group.hub.name
  priority            = 110
  action              = "Allow"

  rule {
    description       = "allow service tags"
    name              = "allow service tags"
    source_addresses  = ["*"]
    destination_ports = ["*"]
    protocols         = ["Any"]

    destination_addresses = [
      "AzureContainerRegistry",
      "MicrosoftContainerRegistry",
      "AzureActiveDirectory"
    ]
  }
}

resource "azurerm_firewall_application_rule_collection" "aksbasics" {
  name                = format("%s-aksbasics", local.service_name)
  azure_firewall_name = module.azure_firewall.resource_id
  resource_group_name = data.azurerm_resource_group.hub.name
  priority            = 101
  action              = "Allow"

  rule {
    name             = "AllowMicrosoftFqdns"
    source_addresses = ["*"]

    target_fqdns = [
      "*.cdn.mscr.io",
      "mcr.microsoft.com",
      "*.data.mcr.microsoft.com",
      "management.azure.com",
      "login.microsoftonline.com",
      "acs-mirror.azureedge.net",
      "dc.services.visualstudio.com",
      "*.opinsights.azure.com",
      "*.oms.opinsights.azure.com",
      "*.microsoftonline.com",
      "*.monitoring.azure.com",
    ]

    protocol {
      port = "80"
      type = "Http"
    }

    protocol {
      port = "443"
      type = "Https"
    }
  }

  rule {
    name             = "AllowFqdnsForOsUpdates"
    source_addresses = ["*"]

    target_fqdns = [
      "download.opensuse.org",
      "security.ubuntu.com",
      "ntp.ubuntu.com",
      "packages.microsoft.com",
      "snapcraft.io"
    ]

    protocol {
      port = "80"
      type = "Http"
    }

    protocol {
      port = "443"
      type = "Https"
    }
  }
}

resource "azurerm_firewall_application_rule_collection" "publicimages" {
  name                = format("%s-publicimages", local.service_name)
  azure_firewall_name = module.azure_firewall.resource_id
  resource_group_name = data.azurerm_resource_group.hub.name
  priority            = 103
  action              = "Allow"

  rule {
    name             = "AllowImagesFqdns"
    source_addresses = ["*"]

    target_fqdns = [
      "auth.docker.io",
      "registry-1.docker.io",
      "production.cloudflare.docker.com"
    ]

    protocol {
      port = "80"
      type = "Http"
    }

    protocol {
      port = "443"
      type = "Https"
    }
  }
}
