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

#######################################################################
# Provider

variable "region" {
  type        = string
  description = "The region that will be used as default value for all resources."
}

#######################################################################
# Hub

variable "network_cidr" {
  description = "CIDR for the VPC"
  type        = string
  default     = "10.0.0.0/8"
}

variable "subnets" {
  description = "Subnets for the hub VPC"
  type        = map(list(map(string)))
  default = {
    zone-1 = [
      {
        name           = "subnet-1"
        cidr           = "10.10.10.0/26"
        public_gateway = true
        acl_name       = "hub-acl"
      }
    ],
    zone-2 = [
      {
        name           = "subnet-2"
        cidr           = "10.10.20.0/26"
        public_gateway = true
        acl_name       = "hub-acl"
      }
    ],
    zone-3 = [
      {
        name           = "subnet-3"
        cidr           = "10.10.30.0/26"
        public_gateway = true
        acl_name       = "hub-acl"
      }
    ]
  }
}

variable "network_acls" {
  description = "Network ACLs for hub VPC"
  default     = {}
}

variable "security_group_rules" {
  description = "Security group rules for hub VPC"
  default     = []
}
