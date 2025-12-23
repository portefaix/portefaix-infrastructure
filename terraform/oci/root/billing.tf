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

# module "billing" {
#   source = "./modules/billing"

#   organization   = var.organization
#   tenancy_ocid   = var.tenancy_ocid
#   compartment_id = var.compartment_id
# }

# module "budgets_compartment" {
#   source = "github.com/oci-landing-zones/terraform-oci-modules-governance//budgets?ref=v0.1.6"
#   # source  = "oci-landing-zones/terraform-oci-modules-iam//modules/groups"
#   # version = "0.3.1"

#   tenancy_ocid = var.tenancy_ocid

#   budgets_configuration = {
#     budgets : {
#       COMPARTMENT-BASED-BUDGET : {
#         name : "compartment-budget"
#         description : local.info_msg
#         target : {
#             type : "COMPARTMENT"
#             values : ["<REPLACE-WITH-COMPARTMENT-OCID"]
#         }
#         amount : <REPLACE-WITH-BUDGET-AMOUNT>
#         schedule : {
#             processing_period_type : "MONTH"
#             day_of_month_to_begin : 1
#         }
#         alert_rule : {
#             threshold_metric : "ACTUAL"
#             threshold_type : "PERCENTAGE"
#             threshold_value : <REPLACE-WITH-THRESHOLD-VALUE>
#             name : "compartment-budget-alert-rule"
#             description : "Alert rule for compartment-budget"
#             recipients : "<REPLACE-WITH-EMAIL-ADDRESS>"
#             message : "Actual spending above 80% of configured budget."
#         }
#     }
#   }
# }

module "budgets_compartment" {
  source = "github.com/oci-landing-zones/terraform-oci-modules-governance//budgets?ref=v0.1.6"
  # source  = "oci-landing-zones/terraform-oci-modules-iam//modules/groups"
  # version = "0.3.1"

  tenancy_ocid = var.tenancy_ocid

  budgets_configuration = {
    budgets : {
      low : {
        name : "low"
        description : "A budget created using all module defaults."
        amount : "5"
        alert_rule : {
          threshold_metric : "ACTUAL"
          threshold_type : "PERCENTAGE"
          threshold_value : "80",
          recipients : var.budget_alert_recipients
          message : "Actual spending above 80% of configured budget."
        }
      },
      # medium : {
      #   name : "medium"
      #   description : "A budget created using all module defaults."
      #   amount : "10"
      #   alert_rule : {
      #     threshold_metric : "ACTUAL"
      #     threshold_type : "PERCENTAGE"
      #     threshold_value : "80",
      #     recipients : var.budget_alert_recipients
      #     message : "Actual spending above 80% of configured budget."
      #   }
      # },
      # high : {
      #   name : "high"
      #   description : "A budget created using all module defaults."
      #   amount : "20"
      #   alert_rule : {
      #     threshold_metric : "ACTUAL"
      #     threshold_type : "PERCENTAGE"
      #     threshold_value : "80",
      #     recipients : var.budget_alert_recipients
      #     message : "Actual spending above 80% of configured budget."
      #   }
      # }
    }
  }
}
