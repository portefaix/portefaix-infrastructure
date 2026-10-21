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

module "iam_role" {
  source = "./modules/iam_role"

  for_each = var.iam_roles

  name           = format("%s-%s", var.name, each.key)
  description    = each.value.description
  editable       = each.value.editable
  permissions    = each.value.permissions
  labels         = merge(local.labels, each.value.labels, { "environment" = each.key })
  create_api_key = each.value.create_api_key
  policy         = each.value.policy
}
