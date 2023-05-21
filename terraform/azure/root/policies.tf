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

resource "azurerm_policy_definition" "rg_require_service_tag" {
  name         = "portefaix-rg-require-tag-service"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Require tag 'service' on resource group"

  metadata = <<METADATA
    {
    "version": "1.0.0",
    "category": "Custom"
    }

METADATA

  policy_rule = <<POLICY_RULE
    {
      "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Resources/subscriptions/resourceGroups"
          },
          {
            "field": "tags['service']",
            "exists": "false"
          }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
POLICY_RULE

}
