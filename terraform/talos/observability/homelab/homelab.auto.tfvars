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

buckets = {
  "portefaix-talos-homelab-logs-admin" = {
    location      = "WEUR"
    storage_class = "Standard"
    days          = 30
  },
  "portefaix-talos-homelab-logs-chunks" = {
    location      = "WEUR"
    storage_class = "Standard"
    days          = 30
  },
  "portefaix-talos-homelab-logs-ruler" = {
    location      = "WEUR"
    storage_class = "Standard"
    days          = 30
  },
  "portefaix-talos-homelab-metrics-admin" = {
    location      = "WEUR"
    storage_class = "Standard"
    days          = 30
  },
  "portefaix-talos-homelab-metrics-alert" = {
    location      = "WEUR"
    storage_class = "Standard"
    days          = 30
  },
  "portefaix-talos-homelab-metrics-ruler" = {
    location      = "WEUR"
    storage_class = "Standard"
    days          = 30
  },
  "portefaix-talos-homelab-metrics-tsdb" = {
    location      = "WEUR"
    storage_class = "Standard"
    days          = 30
  },
  "portefaix-talos-homelab-traces-chunks" = {
    location      = "WEUR"
    storage_class = "Standard"
    days          = 30
  },
  "portefaix-talos-homelab-quickwit-data" = {
    location      = "WEUR"
    storage_class = "Standard"
    days          = 30
  },
}
