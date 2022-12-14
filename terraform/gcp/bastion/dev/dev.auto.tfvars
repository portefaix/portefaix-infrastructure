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
# VPC

network_name = "portefaix-dev"

##############################################################################
# Bastion

name         = "portefaix-dev-bastion"
machine_type = "e2-micro"
disk_size_gb = 50
disk_type    = "pd-standard"

zone = "europe-west1-c"

tags = ["bastion"]

labels = {
  env               = "dev"
  service           = "bastion"
  made-by           = "terraform"
  portefaix-version = "v0-43-0"
}

members = [
  "user:nicolas.lamirault@gmail.com",
]

metadata = {}
