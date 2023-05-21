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

subscription_logging_id = "7d4c373f-e1ca-46e9-83c6-a20bb02bc7b2"

##############################################################################
# Monitor

organization = "portefaix"

location = "westeurope"

tags = {
  "made-by"           = "terraform"
  "service"           = "monitor"
  "project"           = "portefaix"
  "env"               = "audit"
  "portefaix-version" = "v0.43.0"
}
