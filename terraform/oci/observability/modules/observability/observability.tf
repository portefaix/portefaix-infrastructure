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

module "logging" {
  source  = "oracle-terraform-modules/logging/oci"
  version = "0.1.0"

  compartment_id = var.compartment_id

  log_group_name        = local.log_group_name
  log_group_description = format("Log group for %s", local.log_group_name)
  logs                  = var.logs
}

module "observability" {
  source  = "oracle-terraform-modules/observability/oci"
  version = "0.1.0"

  compartment_id = var.compartment_id

  alarms              = var.alarms
  metrics_config      = var.metrics_config
  notification_topics = var.notification_topics
}
