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

data "aws_iam_policy_document" "assume_network" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    resources = [
      format("arn:aws:iam::%s:role/%s", aws_organizations_account.network.id, var.admin_role_name)
    ]
  }
}

resource "aws_iam_group_policy" "assume_network" {
  name   = format("%sAssume%s", title(var.org_name), title(local.network_account))
  group  = var.admin_group_name
  policy = data.aws_iam_policy_document.assume_network.json
}

###################################################################
## Network Assume

data "aws_iam_policy_document" "network" {
  provider = aws.network
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [format("arn:aws:iam::%s:root", data.aws_caller_identity.this.account_id)]
    }
  }
}

##################################################################
## Admin

resource "aws_iam_role" "network" {
  provider           = aws.network
  name               = var.admin_role_name
  assume_role_policy = data.aws_iam_policy_document.network.json

  tags = merge({
    "Name"    = var.admin_role_name,
    "Service" = "IAM"
    },
    var.tags
  )
}

resource "aws_iam_role_policy_attachment" "network" {
  provider   = aws.network
  role       = aws_iam_role.network.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

##################################################################
## Audit

module "network_audit" {
  source = "./modules/iam_audit"

  providers = {
    aws = aws.network
  }

  org_name = var.org_name
  account  = local.network_account

  tags = merge({
    "Service" = "IAM"
    },
  var.tags)
}
