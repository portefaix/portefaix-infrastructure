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

resource "aws_guardduty_detector" "this" {
  provider = aws.audit
  enable   = true

  datasources {
    s3_logs {
      enable = var.enable_s3_protection
    }
    kubernetes {
      audit_logs {
        enable = var.enable_kubernetes_protection
      }
    }
    malware_protection {
      scan_ec2_instance_with_findings {
        ebs_volumes {
          enable = var.enable_malware_protection
        }
      }
    }
  }

  finding_publishing_frequency = var.finding_publishing_frequency

  tags = merge({
    Env = "Audit"
  }, var.tags)
}

resource "aws_guardduty_filter" "this" {
  provider = aws.audit

  for_each = var.filter_config != null ? { for filter in var.filter_config : filter.name => filter } : {}

  detector_id = aws_guardduty_detector.this.id

  name        = each.value.name
  action      = each.value.action
  rank        = each.value.rank
  description = each.value.description

  finding_criteria {
    dynamic "criterion" {
      for_each = each.value.criterion
      content {
        field                 = criterion.value.field
        equals                = criterion.value.equals
        not_equals            = criterion.value.not_equals
        greater_than          = criterion.value.greater_than
        greater_than_or_equal = criterion.value.greater_than_or_equal
        less_than             = criterion.value.less_than
        less_than_or_equal    = criterion.value.less_than_or_equal
      }
    }
  }

  tags = merge({
    Name = each.value.name
    Env  = "Audit"
  }, var.tags)
}

# resource "aws_guardduty_publishing_destination" "this" {
#   provider   = aws.audit

#   detector_id     = aws_guardduty_detector.this.id
#   destination_arn = module.s3_bucket_guardduty.s3_bucket_arn
#   kms_key_arn      = each.value.kms_key_arn == null ? aws_kms_key.guardduty_key[0].arn : each.value.kms_key_arn

#   depends_on = [
#     aws_guardduty_organization_admin_account.this,
#     module.s3_bucket_ipset,
#     aws_kms_key.this,
#   ]
# }

resource "aws_guardduty_ipset" "this" {
  provider = aws.audit

  for_each = { for ipset in var.ipset_config : ipset.name => ipset }

  activate = each.value.activate
  name     = each.value.name
  format   = each.value.format
  location = "https://s3.amazonaws.com/${aws_s3_object.ipset[each.key].bucket}/${each.value.key}"

  tags = merge({
    Name = each.value.name,
    Env  = "Audit"
  }, var.tags)
}

resource "aws_guardduty_threatintelset" "this" {
  provider = aws.audit

  for_each = { for threatintelset in var.threatintelset_config : threatintelset.name => threatintelset }

  detector_id = aws_guardduty_detector.this.id
  activate    = each.value.activate
  name        = each.value.name
  format      = each.value.format
  location    = "https://s3.amazonaws.com/${aws_s3_object.threatintelset[each.key].bucket}/${each.value.key}"

  tags = merge({
    Name = each.value.name,
    Env  = "Audit"
  }, var.tags)
}
