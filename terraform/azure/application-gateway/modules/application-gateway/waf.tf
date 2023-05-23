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

resource "azurerm_web_application_firewall_policy" "this" {
  name                = local.service_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  policy_settings {
    enabled                     = true
    mode                        = "Prevention"
    request_body_check          = true
    file_upload_limit_in_mb     = 100
    max_request_body_size_in_kb = 128
  }

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
    }
  }

  # dynamic "custom_rules" {
  #   for_each = length(var.blocked_countries) == 0 ? : [] : [1]

  #   content {
  #     name      = format("%s-geo-deny", local.service_name)
  #     priority  = 1
  #     rule_type = "MatchRule"

  #     match_conditions {
  #       match_variables {
  #         variable_name = "RemoteAddr"
  #       }
  #       operator           = "GeoMatch"
  #       negation_condition = true
  #       match_values       = var.blocked_countries
  #     }
  #     action = "Block"
  #   }
  # }

  # dynamic "custom_rules" {
  #   for_each = length(var.whitelist_ipv4) == 0 ? : [] : [1]

  #   content {
  #     name      = format("%s-whitelist", local.service_name)
  #     priority  = 10
  #     rule_type = "MatchRule"

  #     match_conditions {
  #       match_variables {
  #         variable_name = "RemoteAddr"
  #       }

  #       operator           = "IPMatch"
  #       negation_condition = false
  #       match_values       = var.whitelist_ipv4
  #     }

  #     action = "Allow"
  #   }
  # }

  # dynamic "custom_rules" {
  #   for_each = length(var.whitelist_ipv4) == 0 ? : [] : [1]

  #   content {
  #     name      = format("%s-blacklist", local.service_name)
  #     priority  = 20
  #     rule_type = "MatchRule"

  #     match_conditions {
  #       match_variables {
  #         variable_name = "RemoteAddr"
  #       }

  #       operator           = "IPMatch"
  #       negation_condition = false
  #       match_values       = var.blacklist_ipv4
  #     }

  #     action = "Block"
  #   }
  # }

  tags = var.tags
}
