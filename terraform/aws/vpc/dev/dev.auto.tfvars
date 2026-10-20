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

region = "eu-west-1"

#############################################################################
# Project

org_name = "portefaix"

core_account_id = "755741063834"

#############################################################################
# VPC

vpc_name = "portefaix-dev"

vpc_subnet_cidr     = "10.1.0.0/16"
public_subnet_cidr  = ["10.1.128.0/20", "10.1.144.0/20", "10.1.160.0/20"]
private_subnet_cidr = ["10.1.0.0/19", "10.1.32.0/19", "10.1.64.0/19"]

enable_nat_gateway = true

vpc_tags = {
  "Name"    = "portefaix-dev"
  "Env"     = "Dev"
  "Service" = "VPC"
}

public_subnet_tags = {
  "Name"    = "portefaix-dev-public"
  "Env"     = "Dev"
  "service" = "Subnets"
}

private_subnet_tags = {
  "Name"    = "portefaix-dev-private"
  "Env"     = "Dev"
  "Service" = "Subnets"
}

igw_eip_name = "portefaix-dev"

igw_tags = {
  "Name"    = "portefaix-dev"
  "Env"     = "Dev"
  "Service" = "Gateway"
  "Role"    = "Internet Gateway"
}

nat_gateway_tags = {
  "Name"    = "portefaix-dev"
  "Env"     = "Dev"
  "Service" = "Gateway"
  "Role"    = "NAT Gateway"
}

eks_cluster_name = "portefaix-dev-eks"
