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

#####################################################################""
# Provider

region = "uk-london-1"


##############################################################################
# Hub

organization   = "portefaix"
environment    = "dev"
compartment_id = "ocid1.compartment.oc1..aaaaaaaas7v6jey7zd67kotets3qk4oi6ile3dbkajpuh7xgye7nzr6lp6hq"


freeform_tags = {
  project = "core"
  env     = "dev"
  made-by = "terraform"
}

# control_plane_cidr = "10.20.00.0/24"
# workers_cidr       = "10.20.10.0/24"
# pub_lb_cidr        = "10.20.20.0/24"
# int_lb_cidr        = "10.20.30.0/24"
