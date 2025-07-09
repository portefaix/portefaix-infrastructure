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
  source  = "nlamirault/observability/google//modules/prometheus"
  version = "6.1.0"

  project = var.project

  namespace       = var.prometheus_namespace
  service_account = var.prometheus_service_account
}

# tfsec:ignore:google-storage-bucket-encryption-customer-key
module "thanos" {
  source  = "nlamirault/observability/google//modules/thanos"
  version = "6.1.0"

  project = var.project

  bucket_location      = var.thanos_bucket_location
  bucket_storage_class = var.thanos_bucket_storage_class
  bucket_labels        = var.thanos_bucket_labels

  namespace                  = var.thanos_namespace
  service_account            = var.thanos_service_account
  prometheus_service_account = var.thanos_sidecar_service_account

  enable_kms       = var.thanos_enable_kms
  keyring_location = var.thanos_keyring_location
  keys             = var.thanos_keys
  kms_labels       = var.thanos_kms_labels

  depends_on = [module.prometheus]
}

# tfsec:ignore:google-storage-bucket-encryption-customer-key
module "loki" {
  source  = "nlamirault/observability/google//modules/loki"
  version = "6.1.0"

  project = var.project

  bucket_location      = var.loki_bucket_location
  bucket_storage_class = var.loki_bucket_storage_class
  bucket_labels        = var.loki_bucket_labels

  namespace       = var.loki_namespace
  service_account = var.loki_service_account

  enable_kms       = var.loki_enable_kms
  keyring_location = var.loki_keyring_location
  keys             = var.loki_keys
  kms_labels       = var.loki_kms_labels
}

# tfsec:ignore:google-storage-bucket-encryption-customer-key
module "tempo" {
  source  = "nlamirault/observability/google//modules/tempo"
  version = "6.1.0"

  project = var.project

  bucket_location      = var.tempo_bucket_location
  bucket_storage_class = var.tempo_bucket_storage_class
  bucket_labels        = var.tempo_bucket_labels

  namespace       = var.tempo_namespace
  service_account = var.tempo_service_account

  enable_kms       = var.tempo_enable_kms
  keyring_location = var.tempo_keyring_location
  keys             = var.tempo_keys
  kms_labels       = var.tempo_kms_labels
}

module "grafana" {
  source  = "nlamirault/observability/google//modules/grafana"
  version = "6.1.0"

  project = var.project

  namespace       = var.grafana_namespace
  service_account = var.grafana_service_account
}
