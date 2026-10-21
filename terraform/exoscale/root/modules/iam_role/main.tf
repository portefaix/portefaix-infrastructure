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

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    exoscale = {
      source  = "exoscale/exoscale"
      version = "0.75.0"
    }
  }
}

resource "exoscale_iam_role" "this" {
  name        = var.name
  description = var.description
  editable    = var.editable
  permissions = var.permissions
  labels      = var.labels

  policy = var.policy == null ? null : {
    default_service_strategy = var.policy.default_service_strategy
    services = {
      for service, cfg in var.policy.services : service => {
        type = cfg.type
        rules = cfg.rules == null ? null : [
          for rule in cfg.rules : {
            action     = rule.action
            expression = rule.expression
          }
        ]
      }
    }
  }
}

resource "exoscale_iam_api_key" "this" {
  count = var.create_api_key ? 1 : 0

  name    = var.name
  role_id = exoscale_iam_role.this.id
}
