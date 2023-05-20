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

resource "azurerm_consumption_budget_subscription" "this" {
  for_each = toset(var.budget_limit_amounts)

  name = format("%s_ALL_Monthly_%s", title(var.organization), each.value)

  subscription_id = var.subscription_id

  amount     = each.value
  time_grain = "Monthly"

  time_period {
    start_date = formatdate("YYYY-MM-01'T'hh:mm:ssZ", timestamp())
    end_date   = timeadd(timestamp(), "8760h")
  }

  notification {
    enabled        = true
    threshold      = 80.0
    operator       = "GreaterThan"
    contact_emails = var.contact_emails
  }

  notification {
    enabled        = true
    threshold      = 100.0
    operator       = "GreaterThan"
    contact_emails = var.contact_emails
  }

  # Avoid recreation of budget on apply
  lifecycle {
    ignore_changes = [
      time_period
    ]
  }
}
