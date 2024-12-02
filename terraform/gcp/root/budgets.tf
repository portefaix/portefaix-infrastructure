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

# tfsec:ignore:google-iam-no-project-level-service-account-impersonation
module "pubsub_budget" {
  source  = "terraform-google-modules/pubsub/google"
  version = "7.0.0"

  project_id = module.shared.project_id
  topic      = format("%s-%s", var.organization_name, var.budget_topic_name)
  topic_labels = merge({
    service     = "billing"
    role        = "pubsub"
    environment = "shared"
  }, var.labels)
}

# module "pubsub_projects_budget" {
#   source  = "terraform-google-modules/pubsub/google"
#   version = "4.0.1"

#   for_each = toset([
#     module.network.project_name,
#     module.shared.project_name,
#     module.testing.project_name,
#     module.audit.project_name,
#     module.logging.project_name,
#     module.core["dev"].project_name
#   ])

#   project_id = module.shared.project_id
#   topic      = format("%s-%s", each.key, var.budget_topic_name)
#   topic_labels = merge({
#     service     = "billing"
#     role        = "pubsub"
#     environment = each.key
#   }, var.labels)
# }

module "billing_budgets" {
  source  = "terraform-google-modules/project-factory/google//modules/budget"
  version = "17.0.1"

  for_each = toset(var.budgets_amounts)

  billing_account = var.billing_account
  display_name    = format("%s %s", var.organization_name, each.value)
  calendar_period = "MONTH"
  projects = [
    module.network.project_id,
    module.shared.project_id,
    module.testing.project_id,
    module.audit.project_id,
    module.logging.project_id,
    module.core["dev"].project_id,
  ]

  amount               = each.value
  alert_spent_percents = var.budget_alert_spent_percents
  alert_pubsub_topic   = module.pubsub_budget.id
}
