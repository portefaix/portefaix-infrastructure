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
# Organization

name                     = "portefaix"
default_service_strategy = "allow"

#############################################################################
# IAM

iam_roles = {
  sandbox = {
    description    = "Sandbox environment role"
    create_api_key = true
    policy = {
      default_service_strategy = "deny"
      services = {
        compute    = { type = "allow" }
        networking = { type = "allow" }
        dns        = { type = "allow" }
      }
    }
  }
  staging = {
    description    = "Staging environment role"
    create_api_key = true
    policy = {
      default_service_strategy = "deny"
      services = {
        compute    = { type = "allow" }
        networking = { type = "allow" }
        dns        = { type = "allow" }
      }
    }
  }
  prod = {
    description    = "Production environment role"
    editable       = false
    create_api_key = true
    policy = {
      default_service_strategy = "deny"
      services = {
        compute    = { type = "allow" }
        networking = { type = "allow" }
        dns        = { type = "allow" }
      }
    }
  }
}
