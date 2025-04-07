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

resource "exoscale_iam_role" "admin_role" {
  name        = local.admin_role_name
  description = "Created by Terraform"

  editable = true

  policy = jsonencode({
    default_service_strategy = "deny",
    services = {
      compute = {
        type = "rules",
        rules = [
          {
            expression = "identity.role_name == '${local.admin_role_name}'"
            resources  = ["*"],
            operations = ["*"]
          }
        ]
      },
      iam = {
        type = "rules",
        rules = [
          {
            expression = "identity.role_name == '${local.admin_role_name}'"
            resources  = ["*"],
            operations = ["list", "get"]
          }
        ]
      },
      storage = {
        type = "rules",
        rules = [
          {
            expression = "identity.role_name == '${local.admin_role_name}'"
            resources  = ["*"],
            operations = ["*"]
          }
        ]
      },
      dns = {
        type = "rules",
        rules = [
          {
            expression = "identity.role_name == '${local.admin_role_name}'"
            resources  = ["*"],
            operations = ["*"]
          }
        ]
      }
    }
  })
}

# resource "exoscale_iam_role" "kubernetes_admin" {
#   name        = "${var.project_name}-${var.environment}-k8s"
#   description = "Rôle Kubernetes pour ${var.project_name} en ${var.environment}"

#   editable = true

#   policy = jsonencode({
#     default_service_strategy = "deny",
#     services = {
#       compute = {
#         type = "rules",
#         rules = [
#           {
#             expression = "identity.role_name == '${var.project_name}-${var.environment}-k8s'",
#             resources  = ["sks"],
#             operations = ["*"]
#           }
#         ]
#       },
#       storage = {
#         type = "rules",
#         rules = [
#           {
#             expression = "identity.role_name == '${var.project_name}-${var.environment}-k8s'",
#             resources  = ["bucket"],
#             operations = ["list", "get", "put"]
#           }
#         ]
#       }
#     }
#   })
# }

# # Création d'une API key pour le rôle Kubernetes
# resource "exoscale_iam_access_key" "kubernetes_key" {
#   name      = "${var.project_name}-${var.environment}-k8s-key"
#   role_id   = exoscale_iam_role.kubernetes_role.id
#   resources = ["*"]
# }
