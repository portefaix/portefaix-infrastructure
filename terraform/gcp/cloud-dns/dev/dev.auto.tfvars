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

######################################################################
# Provider

project = "portefaix-dev"

region = "europe-west1"


##############################################################################
# Cloud DNS

network_name = "portefaix-dev"

zone_name   = "gcp-portefaix"
domain_name = "portefaix.local."

labels = {
  env               = "dev"
  service           = "cloud-dns"
  made-by           = "terraform"
  portefaix-version = "v0-43-0"
}
