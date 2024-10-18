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

resource "spacelift_stack" "this" {
  for_each = var.stacks

  administrative                  = true
  autodeploy                      = false
  branch                          = each.value.branch
  description                     = "created by Terraform"
  name                            = each.key
  project_root                    = each.value.project_root
  space_id                        = spacelift_space.this.id
  protect_from_deletion           = false
  manage_state                    = true
  terraform_external_state_access = true
  terraform_workflow_tool         = "OPEN_TOFU"
  repository                      = var.repository
  labels                          = each.value.labels

  # State file information
  import_state      = "<State File to Upload>"
  import_state_file = "<Path to the State file>"
}

resource "spacelift_environment_variable" "aws_acces_key" {
  stack_id   = spacelift_stack.this["portefaix-homelab-observability"].id
  name       = "AWS_ACCESS_KEY_ID"
  value      = var.access_key
  write_only = true
}

resource "spacelift_environment_variable" "aws_secret_key" {
  stack_id   = spacelift_stack.this["portefaix-homelab-observability"].id
  name       = "AWS_SECRET_ACCESS_KEY"
  value      = var.secret_access_key
  write_only = true
}

resource "spacelift_environment_variable" "aws_endpoint_url_s3" {
  stack_id   = spacelift_stack.this["portefaix-homelab-observability"].id
  name       = "AWS_ENDPOINT_URL_S3"
  value      = format("https://%s.r2.cloudflarestorage.com", var.cloudflare_account_id)
  write_only = true
}

resource "spacelift_environment_variable" "cloudflare_account_id" {
  stack_id   = spacelift_stack.this["portefaix-homelab-observability"].id
  name       = "TF_VAR_cloudflare_account_id"
  value      = var.cloudflare_account_id
  write_only = true
}

resource "spacelift_environment_variable" "cloudflare_api_token" {
  stack_id   = spacelift_stack.this["portefaix-homelab-observability"].id
  name       = "TF_VAR_cloudflare_api_token"
  value      = var.cloudflare_api_token
  write_only = true
}
