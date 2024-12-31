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

# resource "random_id" "tunnel_secret" {
#   byte_length = 35
# }

# resource "cloudflare_tunnel" "this" {
#   account_id = var.cloudflare_account_id
#   name       = var.name
#   secret     = random_id.tunnel_secret.b64_std
# }

# resource "cloudflare_record" "this" {
#   for_each = toset(var.applications)

#   zone_id = data.cloudflare_zone.this.id
#   name    = format("%s", each.key)
#   # name    = format("%s.%s", each.key, var.subdomain)
#   value   = cloudflare_tunnel.this.cname
#   type    = "CNAME"
#   proxied = true
# }

resource "cloudflare_access_application" "this" {
  for_each = toset(var.applications)

  zone_id = data.cloudflare_zone.this.id
  name    = each.key
  domain  = format("%s.%s", each.key, data.cloudflare_zone.this.name)
  session_duration = "1h"
}

resource "cloudflare_access_identity_provider" "github_oauth" {
  account_id = var.cloudflare_account_id
  name       = "GitHub OAuth"
  type       = "github"
  config {
    client_id     = var.github_oauth_client_id
    client_secret = var.github_oauth_client_secret
  }
}

resource "cloudflare_access_policy" "user" {
  for_each = toset(var.applications)

  application_id = cloudflare_access_application.this[each.key].id
  zone_id        = data.cloudflare_zone.this.id
  name           = "User"
  precedence     = 10
  decision       = "allow"

  include {
    login_method = [
      cloudflare_access_identity_provider.github_oauth.id
    ]
  }
}
