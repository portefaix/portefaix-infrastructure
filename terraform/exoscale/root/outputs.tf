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

output "org_policy_id" {
  value       = exoscale_iam_org_policy.this.id
  description = "The ID of the IAM Org Policy."
}

output "iam_role_ids" {
  value       = { for env, mod in module.iam_role : env => mod.role_id }
  description = "The IAM role IDs, keyed by environment."
}

output "iam_api_key_ids" {
  value       = { for env, mod in module.iam_role : env => mod.api_key_id if mod.api_key_id != null }
  description = "The IAM API key IDs, keyed by environment, for roles with an API key."
}
