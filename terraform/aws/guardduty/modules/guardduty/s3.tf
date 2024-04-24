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

# tfsec:ignore:aws-s3-enable-bucket-logging
module "s3_bucket_ipset_log" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  providers = {
    aws = aws.audit
  }

  bucket = format("%s-logs", local.ipset_name)

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "aws:kms"
      }
    }
  }

  tags = merge({
    Name = format("%s-logs", local.ipset_name),
    Env  = "Audit"
  }, var.tags)
}

module "s3_bucket_ipset" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  providers = {
    aws = aws.audit
  }

  bucket = local.ipset_name

  attach_policy                         = true
  policy                                = data.aws_iam_policy_document.guardduty_bucket_policy.json
  attach_deny_insecure_transport_policy = true
  attach_require_latest_tls_policy      = true

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  versioning = {
    status     = true
    mfa_delete = false
  }

  logging = {
    target_bucket = module.s3_bucket_ipset_log.s3_bucket_id
    target_prefix = "log/"
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "aws:kms"
      }
    }
  }

  tags = merge({
    Name = local.ipset_name,
    Env  = "Audit"
  }, var.tags)
}

resource "aws_s3_object" "ipset" {
  provider = aws.audit

  for_each = { for ipset in var.ipset_config : ipset.name => ipset }

  bucket = module.s3_bucket_ipset.s3_bucket_id

  content = each.value.content
  key     = each.value.key

  tags = merge({
    Name = each.value.name,
    Env  = "Audit"
  }, var.tags)
}

resource "aws_s3_object" "threatintelset" {
  provider = aws.audit

  for_each = { for threatintelset in var.threatintelset_config : threatintelset.name => threatintelset }

  bucket = module.s3_bucket_ipset.s3_bucket_id

  content = each.value.content
  key     = each.value.key

  tags = merge({
    Name = each.value.name,
    Env  = "Audit"
  }, var.tags)
}
