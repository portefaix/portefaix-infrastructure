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

############################################################################
# Provider

subscription_core_dev_id = "b7ff400c-0b01-4a49-af59-f179d610026a"

############################################################################
# Secrets

resource_group_name     = "portefaix-dev-secrets"
resource_group_location = "West Europe"

tags = {
  "project"           = "portefaix"
  "made-by"           = "terraform"
  "service"           = "secrets"
  "env"               = "dev"
  "portefaix-version" = "v0.43.0"
}
