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

output "log_group_id" {
  description = "The OCID of the log group"
  value       = module.logging.log_group_id
}

output "logs" {
  description = "The details of the created logs"
  value       = module.logging.logs
}

output "alarms" {
  description = "The details of the created alarms"
  value       = module.observability.alarms
}

output "notification_topics" {
  description = "The details of the created notification topics"
  value       = module.observability.notification_topics
}
