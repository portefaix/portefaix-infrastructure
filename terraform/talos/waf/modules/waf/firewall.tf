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

# Configure a ruleset at the zone level for the "http_request_firewall_managed" phase
# resource "cloudflare_ruleset" "zone_level_managed_waf" {
#   kind    = "zone"
#   zone_id = data.cloudflare_zone.this.id

#   phase       = "http_request_firewall_managed"
#   name        = "Managed WAF entry point ruleset"
#   description = "Zone-level WAF Managed Rules config"

#   # Execute Cloudflare Managed Ruleset
#   rules = [
#     {
#       action = "execute"
#       action_parameters = {
#         id      = "efb7b8c949ac4650a09736fc376e9aee"
#         version = "latest"
#       }
#       expression  = "true"
#       description = "Execute Cloudflare Managed Ruleset on my zone-level phase entry point ruleset"
#       enabled     = true
#     },
#     {
#       action = "execute"
#       action_parameters = {
#         id      = "4814384a9e5d4991b9815dcfc25d2f1f"
#         version = "latest"
#       }
#       expression  = "true"
#       description = "Execute Cloudflare OWASP Core Ruleset on my zone-level phase entry point ruleset"
#       enabled     = true
#     }
#   ]
# }

# resource "cloudflare_ruleset" "zone_level_http_ddos_config" {
#   zone_id     = data.cloudflare_zone.this.id
#   name        = "HTTP DDoS Attack Protection entry point ruleset"
#   description = "Zone level HTTP DDos Attack Protection"
#   kind        = "zone"
#   phase       = "ddos_l7"

#   rules = [
#     {
#       action = "execute"
#       action_parameters = {
#         id = "4d21379b4f9f4bb088e0729962c8b3cf"
#         # overrides {
#         #   rules {
#         #     # Rule: HTTP requests with unusual HTTP headers or URI path (signature #11).
#         #     id                = "fdfdac75430c4c47a959592f0aa5e68a"
#         #     sensitivity_level = "low"
#         #   }
#         # }
#       }
#       expression  = "true"
#       description = "Override the HTTP DDoS Attack Protection managed ruleset"
#       enabled     = true
#     }
#   ]
# }

# not entitled: the use of operator Matches is not allowed, an Advanced Rate Limiting plan is required
# resource "cloudflare_ruleset" "zone_rl" {
#   zone_id     = data.cloudflare_zone.this.id
#   name        = "Rate limiting for my zone"
#   description = "Managed by terraform"
#   kind        = "zone"
#   phase       = "http_ratelimit"

#   rules {
#     action = "block"
#     ratelimit {
#       characteristics = ["cf.colo.id", "ip.src"]
#       period = 60
#       requests_per_period = 100
#       mitigation_timeout = 600
#     }
#     expression = "(http.request.uri.path matches \"^/api/\")"
#     description = "My rate limiting rule"
#     enabled = true
#   }
# }

# resource "cloudflare_ruleset" "managed_waf" {
#   # zone_id     = data.cloudflare_zone.this.id
#   account_id = var.cloudflare_account_id

#   kind  = "managed"
#   name  = "Cloudflare Managed Ruleset"
#   phase = "http_request_firewall_managed"

#   description = "Created by the Cloudflare security team, this ruleset is designed to provide fast and effective protection for all your applications. It is frequently updated to cover new vulnerabilities and reduce false positives."

#   lifecycle {
#     ignore_changes = [rules]
#   }
# }

# resource "cloudflare_ruleset" "block_countries" {
#   kind = "root"
#   # zone_id     = data.cloudflare_zone.this.id
#   account_id  = var.cloudflare_account_id
#   name        = "Zone level block countries"
#   description = "Firewall managed by terraform"
#   phase       = "http_request_firewall_custom"

#   rules = [
#     {
#       enabled     = true
#       description = "Block countries"

#       action = "block"
#       action_parameters = {
#         response = {
#           content      = <<EOT
#             {
#               "success": false,
#               "error": "you have been blocked"
#             }
#             EOT
#           content_type = "application/json"
#           status_code  = 400
#         }
#       }
#       expression = "(ip.geoip.country in {\"CN\" \"IN\" \"RU\"})"

#       logging = {
#         enabled = true
#       }
#     }
#   ]
# }

resource "cloudflare_ruleset" "outdated_protocol" {
  kind    = "zone"
  zone_id = data.cloudflare_zone.this.id

  phase       = "http_request_firewall_custom"
  name        = "Outdated protocol"
  description = "Managed by terraform"

  rules = [{
    action      = "managed_challenge"
    description = "Outdated protocol"
    enabled     = true
    expression  = "(http.request.version in {\"HTTP/1.0\" \"HTTP/1.1\" \"HTTP/1.2\"} and not cf.client.bot)"
  }]
}
