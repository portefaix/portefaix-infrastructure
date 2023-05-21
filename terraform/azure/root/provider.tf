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

provider "azurerm" {
  # subscription_id   = "<azure_subscription_id>"
  # tenant_id         = "<azure_subscription_tenant_id>"
  # client_id         = "<service_principal_appid>"
  # client_secret     = "<service_principal_password>"
  features {}
}

# provider "azurerm" {
#   alias = "core_prod"
#   subscription_id = var.subscription_core_prod_id
#   features {}
# }

# provider "azurerm" {
#   features {}
#   alias = "core_staging"
#   subscription_id = var.subscription_core_staging_id
# }

provider "azurerm" {
  alias           = "core_dev"
  subscription_id = var.subscription_core_dev_id
  features {}
}

provider "azurerm" {
  alias           = "network"
  subscription_id = var.subscription_network_id
  features {}
}

provider "azurerm" {
  alias           = "shared"
  subscription_id = var.subscription_network_id
  features {}
}

# provider "azurerm" {
#   alias = "testing"
#   subscription_id = var.subscription_testing_id
#   features {}
# }

provider "azurerm" {
  alias           = "logging"
  subscription_id = var.subscription_logging_id
  features {}
}

provider "azurerm" {
  alias           = "audit"
  subscription_id = var.subscription_audit_id
  features {}
}
