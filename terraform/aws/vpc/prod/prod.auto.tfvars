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

core_account_id = "571624819032"

#############################################################################
# VPC

vpc_name = "portefaix-prod"

vpc_subnet_cidr     = "10.2.0.0/16"
public_subnet_cidr  = ["10.2.128.0/20", "10.2.144.0/20", "10.2.160.0/20"]
private_subnet_cidr = ["10.2.0.0/19", "10.2.32.0/19", "10.2.64.0/19"]

enable_nat_gateway = true

vpc_tags = {
  "Name"    = "portefaix-prod"
  "Env"     = "Prod"
  "Service" = "VPC"
}

public_subnet_tags = {
  "Name"    = "portefaix-prod-public"
  "Env"     = "Prod"
  "service" = "Subnets"
}

private_subnet_tags = {
  "Name"    = "portefaix-prod-private"
  "Env"     = "Prod"
  "Service" = "Subnets"
}

igw_eip_name = "portefaix-prod"

igw_tags = {
  "Name"    = "portefaix-prod"
  "Env"     = "Prod"
  "Service" = "Gateway"
  "Role"    = "Internet Gateway"
}

nat_gateway_tags = {
  "Name"    = "portefaix-prod"
  "Env"     = "Prod"
  "Service" = "Gateway"
  "Role"    = "NAT Gateway"
}

eks_cluster_name = "portefaix-prod-eks"
