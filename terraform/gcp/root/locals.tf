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

locals {
  org_parent = "organizations/${var.organization_id}"

  # org_admins_org_iam_permissions = var.org_policy_admin_role == true ? [
  #   "roles/orgpolicy.policyAdmin",
  #   "roles/resourcemanager.organizationAdmin",
  #   "roles/billing.user"
  # ] : [
  #   "roles/resourcemanager.organizationAdmin",
  #   "roles/billing.user"
  # ]
  # bucket_self_link_prefix = "https://www.googleapis.com/storage/v1/b/"

  #   optional_groups_to_create = {
  #     for key, value in var.groups.optional_groups : key => value
  #     if value != "" && var.groups.create_groups == true
  #   }
  #   required_groups_to_create = {
  #     for key, value in var.groups.required_groups : key => value
  #     if var.groups.create_groups == true
  #   }

  # tflint-ignore: terraform_unused_declaration
  # categories_map = {
  #   "BILLING" = setunion([
  #     var.group_org_admins,
  #     var.group_billing_admins,
  #   ])
  #   "LEGAL" = setunion([
  #     var.group_org_admins,
  #     var.group_audit_admins,
  #   ])
  #   "PRODUCT_UPDATES" = setunion([
  #     var.group_org_admins,
  #     var.group_billing_admins,
  #   ])
  #   "SECURITY" = setunion([
  #     var.group_org_admins,
  #     var.group_security_admins
  #   ])
  #   "SUSPENSION" = [var.group_org_admins]
  #   "TECHNICAL" = setunion([
  #     var.group_org_admins
  #   ])
  # }

  # tflint-ignore: terraform_unused_declaration
  # boolean_type_organization_policies = toset([
  #   "compute.disableNestedVirtualization",
  #   "compute.disableSerialPortAccess",
  #   "compute.disableGuestAttributesAccess",
  #   "compute.skipDefaultNetworkCreation",
  #   "compute.restrictXpnProjectLienRemoval",
  #   "compute.disableVpcExternalIpv6",
  #   "compute.setNewProjectDefaultToZonalDNSOnly",
  #   "compute.requireOsLogin",
  #   "sql.restrictPublicIp",
  #   "iam.disableServiceAccountKeyCreation",
  #   "iam.automaticIamGrantsForDefaultServiceAccounts",
  #   "iam.disableServiceAccountKeyUpload",
  #   "storage.uniformBucketLevelAccess"
  # ])

}
