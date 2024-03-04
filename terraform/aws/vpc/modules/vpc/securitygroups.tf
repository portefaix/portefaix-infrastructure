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

# tfsec:ignore:aws-ec2-no-public-egress-sgr
module "vpc_endpoints_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.1"

  name        = format("%s-vpc-endpoints", var.vpc_name)
  description = "Security group for VPC endpoint access"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      rule        = "https-443-tcp"
      description = "VPC CIDR HTTPS"
      cidr_blocks = join(",", module.vpc.private_subnets_cidr_blocks)
    },
  ]

  egress_with_cidr_blocks = [
    {
      rule        = "https-443-tcp"
      description = "All egress HTTPS"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = merge({
    "Name" = format("%s-vpc-endpoints", var.vpc_name)
  }, var.vpc_tags)
}
