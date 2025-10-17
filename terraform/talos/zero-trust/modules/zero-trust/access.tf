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


resource "cloudflare_zero_trust_access_application" "kubectl" {
  account_id       = var.cloudflare_account_id
  type             = "self_hosted"
  name             = "kubectl"
  domain           = format("kubectl.%s", data.cloudflare_zone.this.name)
  session_duration = "24h"

  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.admins.id,
      precedence = 1
    }
  ]

  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.pin_login.id,
    cloudflare_zero_trust_access_identity_provider.github_sso.id,
  ]

}

resource "cloudflare_zero_trust_access_application" "this" {
  for_each = toset(var.applications)

  account_id       = var.cloudflare_account_id
  type             = "self_hosted"
  name             = format("Access application for %s %s", each.key, data.cloudflare_zone.this.name)
  domain           = format("%s.%s", each.key, data.cloudflare_zone.this.name)
  session_duration = "24h"

  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.admins.id
      precedence = 1
    },
  ]
}
