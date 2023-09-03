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

resource "random_id" "tunnel_secret" {
  byte_length = 35
}

resource "cloudflare_tunnel" "this" {
  account_id = var.cloudflare_account_id
  name       = var.name
  secret     = random_id.tunnel_secret.b64_std
}

resource "cloudflare_record" "this" {
  for_each = var.records

  zone_id = data.cloudflare_zone.this.id
  name    = format("%s.%s", each.key, local.domain)
  value   = cloudflare_tunnel.this.cname
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_tunnel_config" "this" {
  for_each = var.records

  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.this.id
  config {
    ingress_rule {
      hostname = cloudflare_record.this[each.key].hostname
      service  = format("http://%s", each.value.service)
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_access_application" "this" {
  for_each = var.records

  zone_id          = data.cloudflare_zone.this.id
  name             = format("%s %s %s", each.value.hostname, var.cloud, var.environment)
  domain           = format("%s.%s.%s", each.value.hostname, local.domain, data.cloudflare_zone.this.name)
  session_duration = "1h"
}

resource "cloudflare_access_policy" "this" {
  for_each = var.records

  application_id = cloudflare_access_application.this[each.key].id
  zone_id        = data.cloudflare_zone.this.id
  name           = format("Policy for %s.%s", each.value.hostname, data.cloudflare_zone.this.name)
  precedence     = "1"
  decision       = "allow"
  include {
    email = ["nicolas.lamirault@gmail.com"]
  }
}
