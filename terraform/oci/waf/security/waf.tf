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

resource "oci_waf_web_app_firewall_policy" "this" {
  compartment_id = var.compartment_id
  display_name   = local.waf.service_name

  actions {
    name = "Pre-configured Check Action"
    type = "CHECK"
  }

  actions {
    name = "Pre-configured Allow Action"
    type = "ALLOW"
  }

  actions {
    name = "Pre-configured 401 Response Code Action"
    type = "RETURN_HTTP_RESPONSE"
    body {
      text = "{\"code\":\"401\",\"message\":\"Unauthorized\"}"
      type = "STATIC_TEXT"
    }
    code = 401
    headers {
      name  = "Content-Type"
      value = "application/json"
    }
  }

}

resource "oci_waf_web_app_firewall" "this" {
  compartment_id             = var.compartment_id
  backend_type               = "LOAD_BALANCER"
  load_balancer_id           = var.load_balancer_id
  web_app_firewall_policy_id = oci_waf_web_app_firewall_policy.this.id
  display_name               = local.service_name
}
