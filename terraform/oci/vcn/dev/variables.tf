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

#############################################################################
# Provider

variable "tenancy_ocid" {
  description = "tenancy id where to create the sources"
  type        = string
}

variable "user_ocid" {
  description = "id of user that terraform will use to create the resources"
  type        = string
}

variable "fingerprint" {
  description = "fingerprint of oci api private key"
  type        = string
}

variable "private_key" {
  description = "OCI api private key used"
  type        = string
}

variable "region" {
  description = "the oci region where resources will be created"
  type        = string
}

#############################################################################
# VCN

variable "organization" {
  type        = string
  description = "Name of the Terraform Cloud organization"
}

variable "environment" {
  type        = string
  description = "Name of the Core environment"
}

variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
}

variable "freeform_tags" {
  description = "simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
  type        = map(any)
  default = {
    made-by = "terraform"
  }
}

# variable "nat_gateway_public_ip_id" {
#   description = "OCID of reserved IP address for NAT gateway. The reserved public IP address needs to be manually created."
#   type        = string
# }

variable "vcn_cidrs" {
  description = "The list of IPv4 CIDR blocks the VCN will use."
  type        = list(string)
}

# variable "internet_gateway_route_rules" {
#   description = "(Updatable) List of routing rules to add to Internet Gateway Route Table"
#   type        = list(map(string))
#   default     = null
# }

# variable "nat_gateway_route_rules" {
#   description = "(Updatable) list of routing rules to add to NAT Gateway Route Table"
#   type        = list(map(string))
#   default     = null
# }

# Subnets

# variable "control_plane_cidr" {
#   type        = string
#   description = "Control plane subnet CIDR"
# }

# variable "workers_cidr" {
#   type        = string
#   description = "OKE Workers subnet CIDR"
# }

# variable "pub_lb_cidr" {
#   type        = string
#   description = "Public Load Balancer subnet CIDR"
# }

# variable "int_lb_cidr" {
#   type        = string
#   description = "Internal Load Balancer subnet CIDR"
# }
