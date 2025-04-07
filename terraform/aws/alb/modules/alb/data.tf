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

data "aws_vpc" "this" {
  filter {
    name = "tag:Name"
    values = [
      var.vpc_name
    ]
  }
}

# data "aws_subnet_ids" "public" {
#   vpc_id = data.aws_vpc.this.id
#   filter {
#     name = "tag:Name"
#     values = [
#       format("%s-public", var.vpc_name)
#     ]
#   }
# }

# data "aws_subnet_ids" "private" {
#   vpc_id = data.aws_vpc.this.id
#   filter {
#     name = "tag:Name"
#     values = [
#       format("%s-private", var.vpc_name)
#     ]
#   }
# }

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  tags = {
    public = true
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  tags = {
    private = true
  }
}

data "aws_elb_service_account" "this" {}
