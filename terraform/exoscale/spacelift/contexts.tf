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

resource "spacelift_context" "this" {
  for_each = toset(var.environments)

  name        = format("%s-%s", local.cloud_provider, each.value)
  space_id    = spacelift_space.environment[each.value].id
  description = "Created by Terraform"
  labels      = local.labels
}

resource "spacelift_environment_variable" "exo_api_key" {
  for_each = var.stacks

  name       = "EXOSCALE_API_KEY"
  context_id = spacelift_context.this[each.value.environment].id
  value      = var.exo_api_key
  write_only = true
}

resource "spacelift_environment_variable" "exo_api_secret" {
  for_each = var.stacks

  name       = "EXOSCALE_API_SECRET"
  context_id = spacelift_context.this[each.value.environment].id
  value      = var.exo_api_secret
  write_only = true
}

resource "spacelift_environment_variable" "aws_acces_key_id" {
  for_each = var.stacks

  context_id = spacelift_context.this[each.value.environment].id
  name       = "AWS_ACCESS_KEY_ID"
  value      = var.aws_access_key_id
  write_only = true
}

resource "spacelift_environment_variable" "aws_secret_access_key" {
  for_each = var.stacks

  context_id = spacelift_context.this[each.value.environment].id
  name       = "AWS_SECRET_ACCESS_KEY"
  value      = var.aws_secret_access_key
  write_only = true
}

resource "spacelift_environment_variable" "aws_region" {
  for_each = var.stacks

  context_id = spacelift_context.this[each.value.environment].id
  name       = "AWS_REGION"
  value      = var.aws_default_region
  write_only = true
}
