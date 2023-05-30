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

module "security" {
  # source                  = "oracle-terraform-modules/iam/oci//modules/iam-compartment"
  # version = "2.0.2"
  source = "/Users/nicolas.lamirault/Projects/Forks/terraform-oci-iam/modules/iam-compartment"

  compartment_id          = var.compartment_id
  compartment_name        = "Security"
  compartment_description = "compartment created by terraform"
  compartment_create      = true
  enable_delete           = true

  freeform_tags = merge({
    "service" = "organization"
  }, var.freeform_tags)
}

module "shared" {
  # source                  = "oracle-terraform-modules/iam/oci//modules/iam-compartment"
  # version = "2.0.2"
  source = "/Users/nicolas.lamirault/Projects/Forks/terraform-oci-iam/modules/iam-compartment"

  compartment_id          = var.compartment_id
  compartment_name        = "Shared"
  compartment_description = "compartment created by terraform"
  compartment_create      = true
  enable_delete           = true

  freeform_tags = merge({
    "service" = "organization"
  }, var.freeform_tags)
}

module "core" {
  # source                  = "oracle-terraform-modules/iam/oci//modules/iam-compartment"
  # version = "2.0.2"
  source = "/Users/nicolas.lamirault/Projects/Forks/terraform-oci-iam/modules/iam-compartment"

  compartment_id          = var.compartment_id
  compartment_name        = "Core"
  compartment_description = "compartment created by terraform"
  compartment_create      = true
  enable_delete           = true

  freeform_tags = merge({
    "service" = "organization"
  }, var.freeform_tags)
}

module "suspended" {
  # source                  = "oracle-terraform-modules/iam/oci//modules/iam-compartment"
  # version = "2.0.2"
  source = "/Users/nicolas.lamirault/Projects/Forks/terraform-oci-iam/modules/iam-compartment"

  compartment_id          = var.compartment_id
  compartment_name        = "Suspended"
  compartment_description = "compartment created by terraform"
  compartment_create      = true
  enable_delete           = true

  freeform_tags = merge({
    "service" = "organization"
  }, var.freeform_tags)
}
