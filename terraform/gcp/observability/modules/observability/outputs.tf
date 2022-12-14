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

output "prometheus_service_account" {
  description = "Service Account for Prometheus"
  value       = module.loki.email
}

output "thanos_bucket" {
  description = "Thanos bucket resource"
  value       = module.thanos.bucket.name
}

output "thanos_service_accounts" {
  description = "Service Account for Thanos"
  value       = module.thanos.emails
}

# output "thanos_roles" {
#   description = "Roles for Thanos"
#   value       = module.thanos.roles
# }

# output "thanos_members" {
#   description = "Members which were bound to the Thanos service accounts"
#   value       = module.thanos.members
# }

output "loki_bucket" {
  description = "Loki bucket resource"
  value       = module.loki.bucket.name
}

output "loki_service_account" {
  description = "Service Account for Loki"
  value       = module.loki.email
}

output "tempo_bucket" {
  description = "Tempo bucket resource"
  value       = module.tempo.bucket.name
}

output "tempo_service_account" {
  description = "Service Account for Tempo"
  value       = module.tempo.email
}

output "grafana_service_account" {
  description = "Service Account for Grafana"
  value       = module.grafana.email
}
