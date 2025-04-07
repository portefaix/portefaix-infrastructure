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

resource "spacelift_space" "this" {
  name            = var.space
  parent_space_id = data.spacelift_space.this.id
  description     = "Created by Terraform."
  labels          = concat(local.labels)
}

resource "spacelift_space" "environment" {
  for_each = toset(var.environments)

  name            = format("%s-%s", var.space, each.value)
  parent_space_id = spacelift_space.this.id
  description     = "Created by Terraform."
  labels          = concat(local.labels, [each.value])
}
