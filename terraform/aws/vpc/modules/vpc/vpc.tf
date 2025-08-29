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

# tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name            = var.vpc_name
  cidr            = var.vpc_subnet_cidr
  azs             = data.aws_availability_zones.available.names
  private_subnets = var.private_subnet_cidr
  public_subnets  = var.public_subnet_cidr

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = true
  enable_dns_hostnames   = true
  one_nat_gateway_per_az = false

  # reuse_nat_ips    = true
  # external_nat_ips = [data.aws_eip.igw.id]

  tags = merge({
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared",
  }, var.vpc_tags)

  public_subnet_tags = merge({
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                        = "1"
    "profile"                                       = "public"
  }, var.public_subnet_tags)

  private_subnet_tags = merge({
    "kubernetes.io/cluster/${var.eks_cluster_name}"  = "shared"
    "kubernetes.io/role/internal-elb"                = "1"
    "profile"                                        = "private"
    "karpenter.sh/discovery/${var.eks_cluster_name}" = var.eks_cluster_name
  }, var.private_subnet_tags)

  nat_gateway_tags = var.nat_gateway_tags
  igw_tags         = var.igw_tags
}
