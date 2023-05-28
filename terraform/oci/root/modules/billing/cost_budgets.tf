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

resource "oci_budget_budget" "these" {
  for_each = toset(var.budget_limit_amounts)

  display_name                          = format("%s-ALL-Monthly-%s", title(var.organization), each.value)
  amount                                = each.value
  compartment_id                        = var.tenancy_ocid
  reset_period                          = "MONTHLY"
  target_type                           = "COMPARTMENT"
  budget_processing_period_start_offset = "1"
  description                           = "Made by Terraform"
  targets                               = [var.compartment_id]

  freeform_tags = merge({
    "service" = "billing"
  }, var.freeform_tags)
}

# resource oci_budget_alert_rule "these" {
#   for_each = var.budget

#   budget_id       = oci_budget_budget.these[each.key].id
#   display_name    = "${each.value.service_label}-alert-on-forecasted-spent"
#   defined_tags    = each.value.defined_tags
#   freeform_tags   = each.value.freeform_tags
#   #message = ""
#   recipients      = each.value.budget_alert_recipients
#   threshold       = each.value.budget_alert_threshold
#   threshold_type  = "PERCENTAGE"
#   type            = "FORECAST"
# }
