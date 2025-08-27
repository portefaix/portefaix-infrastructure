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

module "prometheus" {
  source  = "nlamirault/observability/aws//modules/prometheus"
  version = "6.1.0"

  cluster_name        = var.cluster_name
  namespace           = var.prometheus_namespace
  service_account     = var.prometheus_service_account
  enable_irsa         = false
  enable_pod_identity = true
  tags                = var.prometheus_tags
}

module "mimir" {
  source  = "nlamirault/observability/aws//modules/mimir"
  version = "6.1.0"

  cluster_name        = var.cluster_name
  namespace           = var.mimir_namespace
  service_account     = var.mimir_service_account
  enable_kms          = var.mimir_enable_kms
  enable_irsa         = false
  enable_pod_identity = true
  tags                = var.mimir_tags
}

module "loki" {
  source  = "nlamirault/observability/aws//modules/loki"
  version = "6.1.0"

  cluster_name        = var.cluster_name
  namespace           = var.loki_namespace
  service_account     = var.loki_service_account
  enable_kms          = var.loki_enable_kms
  enable_irsa         = false
  enable_pod_identity = true
  tags                = var.loki_tags
}

module "tempo" {
  source  = "nlamirault/observability/aws//modules/tempo"
  version = "6.1.0"

  cluster_name        = var.cluster_name
  namespace           = var.tempo_namespace
  service_account     = var.tempo_service_account
  enable_kms          = var.tempo_enable_kms
  enable_irsa         = false
  enable_pod_identity = true
  tags                = var.tempo_tags
}

module "grafana" {
  source  = "nlamirault/observability/aws//modules/grafana"
  version = "6.1.0"

  cluster_name        = var.cluster_name
  namespace           = var.grafana_namespace
  service_account     = var.grafana_service_account
  enable_irsa         = false
  enable_pod_identity = true
  tags                = var.grafana_tags
}

module "amp" {
  source  = "nlamirault/observability/aws//modules/amp"
  version = "6.1.0"

  name = var.amp_alias
  tags = var.amp_tags
}
