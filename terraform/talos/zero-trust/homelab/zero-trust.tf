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

module "zero-trust" {
  source = "../modules/zero-trust"

  cloudflare_account_id = var.cloudflare_account_id
  # cloudflare_api_token  = var.cloudflare_api_token
  # tunnel_id = var.tunnel_id
  tunnel_name                = var.tunnel_name
  zone_name                  = var.zone_name
  applications               = var.applications
  github_oauth_client_id     = var.github_oauth_client_id
  github_oauth_client_secret = var.github_oauth_client_secret
  cloudflare_email           = var.cloudflare_email
}
