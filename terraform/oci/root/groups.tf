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

resource "oci_identity_policy" "sre" {
  compartment_id = var.compartment_id
  description    = "Made by Terraform"
  name           = format("%s-sre", var.organization)
  statements = [
    format("ALLOW GROUP %s-SRE to manage all-resources in compartment %s", title(var.organization), var.organization)
  ]

  freeform_tags = merge({
    "service" = "iam"
  }, var.freeform_tags)
}

module "sre" {
  # source                  = "oracle-terraform-modules/iam/oci//modules/iam-group"
  # version = "2.0.2"
  source = "/Users/nicolas.lamirault/Projects/Forks/terraform-oci-iam/modules/iam-group"

  tenancy_ocid      = var.tenancy_ocid
  group_name        = format("%s-SRE", title(var.organization))
  group_description = "Made by Terraform"

  # policy_compartment_id = oci_identity_policy.sre.compartment_id
  # user_ids              = [var.user1_id,var.user2_id,var.user3_id]
  # policy_name           = "tf-example-policy" # optional
  # policy_description    = "policy created by terraform" # optional
  # policy_statements     = [ # optional
  #   "Allow group tf_example_group to read instances in compartment tf_example_compartment",
  #   "Allow group tf_example_group to inspect instances in compartment tf_example_compartment",
  # ]

  freeform_tags = merge({
    "service" = "iam"
  }, var.freeform_tags)
}

# resource "oci_identity_policy" "dev" {
#     compartment_id = var.compartment_id
#     description = "Made by Terraform"
#     name = format("%s-sre", var.organization)
#     statements = [
#       format("ALLOW GROUP %s-Development to manage all-resources in compartment %s", title(var.organization), module.core.compartment_name)
#     ]
# }

module "dev" {
  # source                  = "oracle-terraform-modules/iam/oci//modules/iam-group"
  # version = "2.0.2"
  source = "/Users/nicolas.lamirault/Projects/Forks/terraform-oci-iam/modules/iam-group"

  tenancy_ocid      = var.tenancy_ocid
  group_name        = format("%s-Development", title(var.organization))
  group_description = "Made by Terraform"
  # user_ids              = [var.user1_id,var.user2_id,var.user3_id]
  # policy_compartment_id = var.compartment_id
  # policy_name           = "tf-example-policy" # optional
  # policy_description    = "policy created by terraform" # optional
  # policy_statements     = [ # optional
  #   "Allow group tf_example_group to read instances in compartment tf_example_compartment",
  #   "Allow group tf_example_group to inspect instances in compartment tf_example_compartment",
  # ]

  freeform_tags = merge({
    "service" = "iam"
  }, var.freeform_tags)
}

# resource "oci_identity_policy" "audit" {
#     compartment_id = var.compartment_id
#     description = "Made by Terraform"
#     name = format("%s-sre", var.organization)
#     statements = [
#       format("ALLOW GROUP %s-Audit to manage all-resources in compartment %s", title(var.organization), var.organization)
#     ]
# }

module "audit" {
  # source                  = "oracle-terraform-modules/iam/oci//modules/iam-group"
  # version = "2.0.2"
  source = "/Users/nicolas.lamirault/Projects/Forks/terraform-oci-iam/modules/iam-group"

  tenancy_ocid      = var.tenancy_ocid
  group_name        = format("%s-Audit", title(var.organization))
  group_description = "Made by Terraform"
  # user_ids              = [var.user1_id,var.user2_id,var.user3_id]
  # policy_compartment_id = var.compartment_id
  # policy_name           = "tf-example-policy" # optional
  # policy_description    = "policy created by terraform" # optional
  # policy_statements     = [ # optional
  #   "Allow group tf_example_group to read instances in compartment tf_example_compartment",
  #   "Allow group tf_example_group to inspect instances in compartment tf_example_compartment",
  # ]

  freeform_tags = merge({
    "service" = "iam"
  }, var.freeform_tags)
}
