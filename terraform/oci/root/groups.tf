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

# module "groups" {
#   source = "github.com/oci-landing-zones/terraform-oci-modules-iam//groups?ref=v0.3.1"
#   # source  = "oci-landing-zones/terraform-oci-modules-iam//modules/groups"
#   # version = "0.3.1"

#   tenancy_ocid = var.tenancy_ocid

#   groups_configuration = {
#     default_defined_tags : null
#     default_freeform_tags : null
#     groups : {
#       admin : {
#         name : "admin",
#         description : "IAM administrators group."
#         #members : [],
#         #defined_tags : null,
#         #freeform_tags : null
#       },
#     }
#   }
# }

# resource "oci_identity_policy" "sre" {
#   compartment_id = var.compartment_id
#   name           = format("%s-sre", var.organization)
#   description    = local.info_msg

#   statements = [
#     format("ALLOW GROUP %s-SRE to manage all-resources in compartment %s", title(var.organization), var.organization)
#   ]

#   freeform_tags = merge({
#     "service" = "iam"
#   }, var.freeform_tags)
# }

# module "group_admin" {
#   source = "github.com/oci-landing-zones/terraform-oci-modules-iam//groups?ref=v0.3.1"
#   # source  = "oci-landing-zones/terraform-oci-modules-iam//modules/groups"
#   # version = "0.3.1"

#   tenancy_ocid      = var.tenancy_ocid
#   group_name        = format("%s-Admin", title(var.organization))
#   group_description = local.info_msg

#   freeform_tags = merge({
#     "service" = "iam"
#   }, var.freeform_tags)
# }

# module "group_security" {
#   source = "github.com/oci-landing-zones/terraform-oci-modules-iam//groups?ref=v0.3.1"
#   # source  = "oci-landing-zones/terraform-oci-modules-iam//modules/groups"
#   # version = "0.3.1"

#   tenancy_ocid      = var.tenancy_ocid
#   group_name        = format("%s-Security", title(var.organization))
#   group_description = local.info_msg

#   freeform_tags = merge({
#     "service" = "iam"
#   }, var.freeform_tags)
# }


# module "group_dev" {
#   source = "github.com/oci-landing-zones/terraform-oci-modules-iam//groups?ref=v0.3.1"
#   # source  = "oci-landing-zones/terraform-oci-modules-iam//modules/groups"
#   # version = "0.3.1"

#   tenancy_ocid      = var.tenancy_ocid
#   group_name        = format("%s-Development", title(var.organization))
#   group_description = local.info_msg

#   freeform_tags = merge({
#     "service" = "iam"
#   }, var.freeform_tags)
# }

# module "group_audit" {
#   source = "github.com/oci-landing-zones/terraform-oci-modules-iam//groups?ref=v0.3.1"
#   # source  = "oci-landing-zones/terraform-oci-modules-iam//modules/groups"
#   # version = "0.3.1"

#   tenancy_ocid      = var.tenancy_ocid
#   group_name        = format("%s-Audit", title(var.organization))
#   group_description = local.info_msg

#   freeform_tags = merge({
#     "service" = "iam"
#   }, var.freeform_tags)
# }
