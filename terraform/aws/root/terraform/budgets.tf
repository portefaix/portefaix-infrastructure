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

module "billing" {
  source  = "nlamirault/billing/aws"
  version = "0.1.0"

  org_name = var.org_name

  account_ids = { for account in local.org_accounts : account.name => account.id }
  emails      = [local.budget_admin_email]

  budget_limit_amounts = var.budget_limit_amounts
  budget_limit_unit    = var.budget_limit_unit
  budget_time_unit     = var.budget_time_unit
  budget_services      = {}

  sns_topic_name = local.sns_budget_topic_name

  tags = merge({
    "Service" = "Budgets"
    },
  var.tags)
}
