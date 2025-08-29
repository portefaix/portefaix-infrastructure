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
  value       = module.observability.prometheus_service_account
}

output "loki_bucket" {
  description = "Loki bucket resource"
  value       = module.observability.loki_bucket
}

output "loki_service_account" {
  description = "Service Account for Loki"
  value       = module.observability.loki_service_account
}

output "tempo_bucket" {
  description = "Tempo bucket resource"
  value       = module.observability.tempo_bucket
}

output "tempo_service_account" {
  description = "Service Account for Tempo"
  value       = module.observability.tempo_service_account
}

output "grafana_service_account" {
  description = "Service Account for Grafana"
  value       = module.observability.grafana_service_account
}
