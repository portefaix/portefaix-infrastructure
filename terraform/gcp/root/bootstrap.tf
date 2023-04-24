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

# module "bootstrap" {
#   source  = "terraform-google-modules/bootstrap/google"
#   version = "6.2.0"

#   org_id          = var.organization_id
#   billing_account = var.billing_account

#   group_org_admins     = var.group_org_admins
#   group_billing_admins = var.group_billing_admins
#   default_region       = var.default_region

#   sa_org_iam_permissions = var.sa_org_iam_permissions
#   sa_enable_impersonation = var.sa_enable_impersonation
#   tf_service_account_id = var.tf_service_account_id
#   tf_service_account_name = var.tf_service_account_name

#   project_labels = merge({
#     service = "organization"
#   }, var.labels)
# }