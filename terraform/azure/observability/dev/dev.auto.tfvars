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

############################################################################
# Provider


##############################################################################
# Obervability

# Prometheus

cluster_rg_name = "portefaix-dev-aks"
cluster_name    = "portefaix-dev-aks"

prometheus_namespace       = "monitoring"
prometheus_service_account = "prometheus"

prometheus_tags = {
  "made-by"           = "terraform"
  "service"           = "prometheus"
  "project"           = "portefaix"
  "env"               = "dev"
  "portefaix-version" = "v0.43.0"
}

# Mimir

mimir_namespace       = "monitoring"
mimir_service_account = "mimir"

mimir_tags = {
  "made-by"           = "terraform"
  "service"           = "thanos"
  "project"           = "portefaix"
  "env"               = "dev"
  "portefaix-version" = "v0.43.0"
}

# Loki

loki_namespace       = "logging"
loki_service_account = "loki"

loki_tags = {
  "made-by"           = "terraform"
  "service"           = "loki"
  "project"           = "portefaix"
  "env"               = "dev"
  "portefaix-version" = "v0.43.0"
}

# Tempo

tempo_namespace       = "tracing"
tempo_service_account = "tempo"

tempo_tags = {
  "made-by"           = "terraform"
  "service"           = "tempo"
  "project"           = "portefaix"
  "env"               = "dev"
  "portefaix-version" = "v0.43.0"
}
