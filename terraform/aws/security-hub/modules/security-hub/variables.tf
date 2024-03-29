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
# Project

variable "org_name" {
  type        = string
  description = "Name of the AWS Organization"
}

variable "org_email" {
  type        = string
  description = "Email of the AWS Organization"
}

variable "org_email_domain" {
  type        = string
  description = "Email domain of the AWS Organization (like gmail.com)"
}

#############################################################################
# Security Hub

# variable "audit_account_id" {
#   type        = string
#   description = "ID of the Audit AWS Account"
# }

variable "service_name" {
  description = "Name of the service"
  type        = string
}

variable "members" {
  description = "Security Hub members"
  type        = map(string)
}

variable "enable_aws_foundational" {
  type        = bool
  description = "Enable AWS Foundational Security Best Practices"
}

variable "enable_cis" {
  type        = bool
  description = "Enable CIS AWS Foundations"
}

variable "enable_pci_dss" {
  type        = bool
  description = "Enable Payment Card Industry Data Security Standard (PCI DSS"
}

variable "tags" {
  type        = map(string)
  description = "Tags for AWS resources"
  default = {
    "Made-By" = "terraform"
  }
}

variable "sns_create_topic" {
  description = "Whether to create the SNS topic"
  type        = bool
  default     = true
}

variable "display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = "Managed by Terraform"
}
