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

provider "google" {
  alias = "bootstrap"
  region  = var.region
  project = var.bootstrap_project_id
}

provider "google" {
  alias = "network"
  region  = var.region
  project = var.network_project_id
}

provider "google" {
  alias = "shared"
  region  = var.region
  project = var.shared_project_id
}

provider "google" {
  alias = "logging"
  region  = var.region
  project = var.logging_project_id
}

provider "google" {
  alias = "testing"
  region  = var.region
  project = var.testing_project_id
}

provider "google" {
  alias = "audit"
  region  = var.region
  project = var.audit_project_id
}

provider "google" {
  alias = "core_dev"
  region  = var.region
  project = var.core_dev_project_id
}

provider "google-beta" {
  alias = "bootstrap"
  region  = var.region
  project = var.bootstrap_project_id
}

provider "google-beta" {
  alias = "network"
  region  = var.region
  project = var.network_project_id
}

provider "google-beta" {
  alias = "shared"
  region  = var.region
  project = var.shared_project_id
}

provider "google-beta" {
  alias = "logging"
  region  = var.region
  project = var.logging_project_id
}

provider "google-beta" {
  alias = "testing"
  region  = var.region
  project = var.testing_project_id
}

provider "google-beta" {
  alias = "audit"
  region  = var.region
  project = var.audit_project_id
}

provider "google-beta" {
  alias = "core_dev"
  region  = var.region
  project = var.core_dev_project_id
}
