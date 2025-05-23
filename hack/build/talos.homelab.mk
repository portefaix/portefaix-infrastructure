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

TALOS_CLUSTER_homelab = portefaix-talos-homelab

TALOS_ENDPOINT_homelab = https://192.168.0.61:6443

KUBE_CONTEXT_homelab = portefaix-talos-homelab

AKEYLESS_PROFILE_homelab = portefaix-homelab

CLOUDFLARE_BUCKET_homelab = portefaix-talos-tfstates
CLOUDFLARE_ACCOUNT_homelab = $(shell echo ${CLOUDFLARE_ACCOUNT_ID})
