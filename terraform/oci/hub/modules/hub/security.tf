
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

resource "oci_core_security_list" "hub_public_sl" {
  compartment_id = var.compartment_id
  vcn_id         = module.hub_vcn.vcn_id
  display_name   = "hub-public-security-list"

  # SSH
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false

    tcp_options {
      min = 22
      max = 22
    }
  }

  # ICMP (ping)
  ingress_security_rules {
    protocol    = "1" # ICMP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false

    icmp_options {
      type = 8
    }
  }

  # internal traffic
  ingress_security_rules {
    protocol    = "all"
    source      = var.vcn_cidrs
    source_type = "CIDR_BLOCK"
    stateless   = false
  }

  # egress rules
  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = false
  }

  freeform_tags = var.freeform_tags
}

resource "oci_core_security_list" "hub_private_sl" {
  compartment_id = var.compartment_id
  vcn_id         = module.hub_vcn.vcn_id
  display_name   = "hub-private-security-list"

  # internal traffic
  ingress_security_rules {
    protocol    = "all"
    source      = var.vcn_cidrs
    source_type = "CIDR_BLOCK"
    stateless   = false
  }

  # egress rules
  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = false
  }

  freeform_tags = var.freeform_tags
}
