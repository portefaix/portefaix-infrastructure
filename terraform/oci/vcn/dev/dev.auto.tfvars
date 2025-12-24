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


##############################################################################
# Hub

organization   = "portefaix"
environment    = "dev"
compartment_id = "ocid1.compartment.oc1..aaaaaaaadidqfuuf2uenboptuyo2mmldobk7vq6mabddrxlgrz5a2rurwkeq"

vcn_cidrs = ["10.1.0.0/16"]

freeform_tags = {
  Project     = "Core"
  Environment = "Dev"
  Managed-By  = "Terraform"
}

# control_plane_cidr = "10.20.00.0/24"
# workers_cidr       = "10.20.10.0/24"
# pub_lb_cidr        = "10.20.20.0/24"
# int_lb_cidr        = "10.20.30.0/24"
