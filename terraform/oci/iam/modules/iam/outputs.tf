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

output "policy_id" {
  description = "The OCID of the created policy"
  value       = module.iam.policy_id
}

output "dynamic_group_id" {
  description = "The OCID of the created dynamic group"
  value       = module.iam.dynamic_group_id
}

output "users" {
  description = "The details of the created users"
  value       = module.iam_users_groups.users
}

output "groups" {
  description = "The details of the created groups"
  value       = module.iam_users_groups.groups
}

output "policies" {
  description = "The details of the created policies"
  value       = module.iam_policies.policies
}
