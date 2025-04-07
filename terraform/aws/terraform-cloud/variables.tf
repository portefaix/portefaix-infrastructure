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

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "default_tags" {
  type        = map(string)
  description = "Tags for the AWS provider"
  default = {
    "Project"           = "Portefaix"
    "Made-By"           = "Terraform"
    "Portefaix-Version" = "v0.41.0"
  }
}

#############################################################################
# Terraform Cloud

variable "organization" {
  type        = string
  description = "Name of the Terraform Cloud organization"
}

variable "workspace_environment" {
  type        = string
  description = "Workspace environement name"
}

variable "workspaces" {
  type = map(object({
    directory      = string
    tags           = list(string)
    gitops         = bool
    branch         = string,
    auto_apply     = bool,
    execution_mode = string,
    trigger        = list(string)
  }))
  description = "Terraform cloud workspaces"
}

variable "gh_organization" {
  type        = string
  description = "Organization name in your VCS provider"
}

variable "gh_repo" {
  type        = string
  description = "Repository name in your VCS provider"
}

variable "github_oauth_token" {
  type        = string
  description = "Github token for Terraform Cloud"
}

# variable "access_key" {
#   type        = string
#   description = "AWS access key"
# }

# variable "secret_key" {
#   type        = string
#   description = "AWS secret key"
# }

variable "aws_role_arn" {
  type        = string
  description = "AWS Role ARN for Terraform Cloud"
}

variable "slack_webhook_url" {
  type        = string
  description = "Slack webhook for SNS notifications"
}

variable "portefaix_version" {
  type        = string
  description = "Portefaix version"
}

variable "org_email" {
  type        = string
  description = "Email of the AWS Organization"
}

variable "org_email_domain" {
  type        = string
  description = "Email domain of the AWS Organization (like gmail.com)"
}
