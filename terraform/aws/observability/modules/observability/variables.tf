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

#############################################################################
# Observability

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

# Prometheus

variable "prometheus_namespace" {
  type        = string
  description = "The Kubernetes namespace"
}

variable "prometheus_service_account" {
  type        = string
  description = "The Kubernetes service account"
}

variable "prometheus_tags" {
  type        = map(string)
  description = "Tags for Loki"
  default = {
    "Made-By" = "terraform"
  }
}

# Mimir

variable "mimir_namespace" {
  type        = string
  description = "The Kubernetes namespace"
}

variable "mimir_service_account" {
  type        = string
  description = "The Kubernetes service account"
}

variable "mimir_tags" {
  type        = map(string)
  description = "Tags for Mimir"
  default = {
    "Made-By" = "terraform"
  }
}

variable "mimir_enable_kms" {
  type        = bool
  description = "Enable custom KMS key"
}

# Loki

variable "loki_namespace" {
  type        = string
  description = "The Kubernetes namespace"
}

variable "loki_service_account" {
  type        = string
  description = "The Kubernetes service account"
}

variable "loki_tags" {
  type        = map(string)
  description = "Tags for Loki"
  default = {
    "Made-By" = "terraform"
  }
}

variable "loki_enable_kms" {
  type        = bool
  description = "Enable custom KMS key"
}

# Tempo

variable "tempo_namespace" {
  type        = string
  description = "The Kubernetes namespace"
}

variable "tempo_service_account" {
  type        = string
  description = "The Kubernetes service account"
}

variable "tempo_tags" {
  type        = map(string)
  description = "Tags for Loki"
  default = {
    "Made-By" = "terraform"
  }
}

variable "tempo_enable_kms" {
  type        = bool
  description = "Enable custom KMS key"
}

# Grafana

variable "grafana_namespace" {
  type        = string
  description = "The Kubernetes namespace"
}

variable "grafana_service_account" {
  type        = string
  description = "The Kubernetes service account"
}

variable "grafana_tags" {
  type        = map(string)
  description = "Tags for Loki"
  default = {
    "Made-By" = "terraform"
  }
}

# AWS Managed Prometheus

variable "amp_alias" {
  description = "AWS Managed Prometheus workspace name"
  type        = string
}

variable "amp_tags" {
  type        = map(string)
  description = "Tags for AMP"
  default = {
    "Made-By" = "Terraform"
  }
}
