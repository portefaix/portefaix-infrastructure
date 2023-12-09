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

######################################################################
# Provider

region = "europe-west1"

network_project_id = "portefaix-network-8f80"
shared_project_id = "portefaix-shared-ded0"
logging_project_id = "portefaix-logging-dc58"
testing_project_id = "portefaix-testing-e28c"
audit_project_id = "portefaix-audit-d881"
core_dev_project_id = "portefaix-core-dev-4d8a"
# core_staging_project_id = ""
# core_prod_project_id = ""

#############################################################################
# OIDC

tfcloud_uri = "https://app.terraform.io"

github_actions_uri = "https://token.actions.githubusercontent.com"

tfcloud_organization_id = "portefaix"
tfcloud_workspace_id = "111"