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

data "tls_certificate" "tfcloud" {
  url = local.tfcloud_url
}

data "aws_iam_policy_document" "tfcloud" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.tfcloud.arn]
    }

    condition {
      test     = "StringEquals"
      variable = format("%s:aud", var.tfcloud_hostname)
      values   = [local.tfcloud_workload_identity_audience]
    }

    condition {
      test     = "StringLike"
      variable = format("%s:sub", var.tfcloud_hostname)
      values = [
        format("organization:%s:project:*:workspace:*:run_phase:plan", var.organization),
        format("organization:%s:project:*:workspace:*:run_phase:apply", var.organization),
      ]
    }
  }
}
