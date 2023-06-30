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
