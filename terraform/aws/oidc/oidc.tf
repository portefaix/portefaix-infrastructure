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

module "iam_github_oidc_provider" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-provider"
  version = "5.48.0"

  tags = local.tags
}

module "iam_github_oidc_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-role"
  version = "5.48.0"

  name        = "PortefaixGithubActions"
  description = "IAM role that can be assumed by GitHub Actions"

  subjects = [
    format("repo:%s:pull_request", var.github_repo),
    format("%s:ref:refs/heads/master", var.github_repo),
  ]

  policies = {
    AdministratorAccess = local.oidc_policy
  }

  tags = local.tags
}

resource "aws_iam_openid_connect_provider" "tfcloud" {
  url             = local.tfcloud_url
  client_id_list  = [local.tfcloud_workload_identity_audience]
  thumbprint_list = [data.tls_certificate.tfcloud.certificates[0].sha1_fingerprint]

  tags = local.tags
}

resource "aws_iam_role" "tfcloud" {
  name        = format("PortefaixTFCloud-%s", var.organization)
  description = "IAM role that can be assumed by Terraform Cloud"

  assume_role_policy = data.aws_iam_policy_document.tfcloud.json

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "tfcloud" {
  role       = aws_iam_role.tfcloud.name
  policy_arn = local.oidc_policy
}
