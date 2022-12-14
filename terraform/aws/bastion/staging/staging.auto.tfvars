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

core_account_id = "845676325565"

#############################################################################
# Networking

vpc_name = "portefaix-staging"

#############################################################################
# IAM

ec2_ssm_role_name = "aws-ec2-ssm"

ec2_ssm_tags = {
  "Env"     = "Staging"
  "Service" = "Bastion"
}

#############################################################################
# Bastion

asg_name = "portefaix-staging-bastion"

asg_tags = {
  "Env"     = "Staging"
  "Service" = "Bastion"
}

sg_name = "portefaix-staging-bastion"

min_size         = 1
max_size         = 1
desired_capacity = 1

instance_type = "t3.micro"
