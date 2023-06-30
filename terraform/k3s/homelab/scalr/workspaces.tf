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

resource "scalr_tag" "this" {
  for_each = toset(var.tags)

  name       = each.key
  account_id = var.account_id
}

resource "scalr_workspace" "this" {
  for_each = var.workspaces

  name            = each.key
  environment_id  = data.scalr_environment.this.id
  vcs_provider_id = data.scalr_vcs_provider.this.id

  working_directory = each.value.directory

  vcs_repo {
    identifier = var.gh_repo
    branch     = each.value.branch
    # trigger_prefixes    = ["stage", "prod"]
  }

  tag_ids = [scalr_tag.this["main"].id]

  # provider_configuration {
  #   id    = "pcfg-1"
  #   alias = "us_east1"
  # }
  # provider_configuration {
  #   id    = "pcfg-2"
  #   alias = "us_east2"
  # }
}

# resource "tfe_workspace" "this" {
#   for_each = var.workspaces

#   name              = each.key
#   organization      = data.tfe_organization.portefaix.name
#   project_id        = tfe_project.this.id
#   description       = format("The %s workspace", each.key)
#   working_directory = each.value.directory

#   dynamic "vcs_repo" {
#     for_each = each.value.gitops ? [{ "branch" = each.value.branch }] : []
#     content {
#       identifier     = format("%s/%s", var.gh_organization, var.gh_repo)
#       branch         = vcs_repo.value.branch
#       oauth_token_id = tfe_oauth_client.github.oauth_token_id
#     }
#   }

#   queue_all_runs      = false
#   global_remote_state = true
#   trigger_prefixes    = each.value.trigger
#   allow_destroy_plan  = true
#   execution_mode      = each.value.execution_mode
#   auto_apply          = each.value.auto_apply

#   tag_names = each.value.tags
# }

resource "scalr_variable" "example" {
  key          = "my_key_name"
  value        = "my_value_name"
  category     = "terraform"
  description  = "variable description"
  workspace_id = scalr_workspace.example.id
}
