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

resource "azurerm_subnet" "this" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = data.azurerm_resource_group.hub.name
  virtual_network_name = data.azurerm_virtual_network.hub.name
  address_prefixes     = [var.subnet_prefix]
}

resource "azurerm_public_ip" "this" {
  name                = format("%s-core", local.service_name)
  resource_group_name = data.azurerm_resource_group.hub.name
  location            = data.azurerm_resource_group.hub.location
  allocation_method   = "Static"
  zones               = var.zones
  sku                 = var.sku
  tags                = var.tags
}

resource "azurerm_firewall" "this" {
  name                = format("%s-core", local.service_name)
  resource_group_name = data.azurerm_resource_group.hub.name
  location            = data.azurerm_resource_group.hub.location
  zones               = var.zones
  sku_name            = var.sku_firewall
  sku_tier            = var.sku

  ip_configuration {
    name                 = format("%s-core", local.service_name)
    subnet_id            = azurerm_subnet.this.id
    public_ip_address_id = azurerm_public_ip.this.id
  }

  tags = var.tags
}

resource "azurerm_firewall_network_rule_collection" "time" {
  name                = format("%s-time", local.service_name)
  azure_firewall_name = azurerm_firewall.this.name
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
  azure_firewall_name = azurerm_firewall.this.name
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
  azure_firewall_name = azurerm_firewall.this.name
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
  azure_firewall_name = azurerm_firewall.this.name
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
  azure_firewall_name = azurerm_firewall.this.name
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
