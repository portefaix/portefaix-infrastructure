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

module "compartments" {
  source = "github.com/oci-landing-zones/terraform-oci-modules-iam//compartments?ref=v0.3.1"
  # source  = "https://github.com/oci-landing-zones/terraform-oci-modules-iam//modules/compartments"
  # version = "0.3.1"

  tenancy_ocid = var.tenancy_ocid

  compartments_configuration = {
    default_parent_id = var.compartment_id
    compartments = {
      security = {
        name        = "security"
        description = local.info_msg
        children = {
          audit = {
            name        = "audit"
            description = local.info_msg
          }
        }
        freeform_tags = merge({
          "service" = "organization"
        }, var.freeform_tags)
      },
      shared = {
        name        = "shared"
        description = local.info_msg
        children = {
          network = {
            name        = "network"
            description = local.info_msg
          },
          testing = {
            name        = "testing"
            description = local.info_msg
          }
        }
        freeform_tags = merge({
          "service" = "organization"
        }, var.freeform_tags)
      },
      core = {
        name        = "core"
        description = local.info_msg
        children = {
          core-dev = {
            name        = "core-dev"
            description = local.info_msg
          },
          core-staging = {
            name        = "core-staging"
            description = local.info_msg
          },
          core-prod = {
            name        = "core-prod"
            description = local.info_msg
          }
        }
        freeform_tags = merge({
          "service" = "organization"
        }, var.freeform_tags)
      },
      suspended = {
        name        = "suspended"
        description = local.info_msg
        freeform_tags = merge({
          "service" = "organization"
        }, var.freeform_tags)
      }
    }
  }
}
