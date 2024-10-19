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

#####################################################################""
# Provider

region = "eu-west-1"

##############################################################################
# Spacelift

repository = "portefaix-infrastructure"

space        = "aws"
environments = ["orga", "shared", "testing", "staging"]


stacks = {

  # Organization

  portefaix-aws-orga-guardduty = {
    project_root = "terraform/aws/guardduty/orga"
    labels       = ["security", "guardduty"]
    environment  = "orga"
    branch       = "main"
  },
  portefaix-aws-orga-cloudtrail = {
    project_root = "terraform/aws/cloudtrail/orga"
    labels       = ["logging", "events", "cloudtrail"]
    environment  = "orga"
    branch       = "main"
  },
  portefaix-aws-orga-access-analyzer = {
    project_root = "terraform/aws/access-analyzer/orga"
    labels       = ["security", "access-analyzer"]
    environment  = "orga"
    branch       = "main"
  },
  portefaix-aws-orga-security-hub = {
    project_root = "terraform/aws/security-hub/orga"
    labels       = ["security", "securityhub"]
    environment  = "orga"
    branch       = "main"
  },
  portefaix-aws-orga-config = {
    project_root = "terraform/aws/config/orga"
    labels       = ["security", "config"]
    environment  = "orga"
    branch       = "main"
  },

  portefaix-aws-orga-guardduty = {
    project_root = "terraform/aws/guardduty/orga"
    labels       = ["security", "guardduty"]
    environment  = "orga"
    branch       = "main"
  },
  portefaix-aws-orga-cloudtrail = {
    project_root = "terraform/aws/cloudtrail/orga"
    labels       = ["logging", "events", "cloudtrail"]
    environment  = "orga"
    branch       = "main"
  },
  portefaix-aws-orga-access-analyzer = {
    project_root = "terraform/aws/access-analyzer/orga"
    labels       = ["security", "access-analyzer"]
    environment  = "orga"
    branch       = "main"
  },
  portefaix-aws-orga-security-hub = {
    project_root = "terraform/aws/security-hub/orga"
    labels       = ["security", "securityhub"]
    environment  = "orga"
    branch       = "main"
  },
  portefaix-aws-orga-config = {
    project_root = "terraform/aws/config/orga"
    labels       = ["security", "config"]
    environment  = "orga"
    branch       = "main"
  },

  # Network Account

  # Logging Account

  # Audit Account

  # Shared Account

  portefaix-aws-shared-chatbot = {
    project_root = "terraform/aws/chatbot/shared"
    labels       = ["shared", "events", "chatbot"]
    environment  = "shared"
    branch       = "main"
  },
  portefaix-aws-shared-ecr = {
    project_root = "terraform/aws/ecr/shared"
    labels       = ["shared", "ecr"]
    environment  = "shared"
    branch       = "main"
  },

  # Testing Account

  portefaix-aws-testing-chaos = {
    project_root = "terraform/aws/chaos/testing"
    labels       = ["testing", "events", "chaos"]
    environment  = "testing"
    branch       = "main"
  },

  # # Core-Staging Account

  portefaix-aws-staging-vpc = {
    project_root = "terraform/aws/vpc/staging"
    labels       = ["core", "vpc"]
    environment  = "staging"
    branch       = "main"
  },
  portefaix-aws-staging-eip-igw = {
    project_root = "terraform/aws/elastic-ips/internet-gateway/staging"
    labels       = ["core", "elasticip", "internetgateway"]
    environment  = "staging"
    branch       = "main"
  },
  portefaix-aws-staging-alb = {
    project_root = "terraform/aws/alb/staging"
    labels       = ["core", "alb"]
    environment  = "staging"
    branch       = "main"
  },
  portefaix-aws-staging-eks = {
    project_root = "terraform/aws/eks/staging"
    labels       = ["core", "eks"]
    environment  = "staging"
    branch       = "main"
  },
  portefaix-aws-staging-ecr = {
    project_root = "terraform/aws/ecr/staging"
    labels       = ["core", "ecr"]
    environment  = "staging"
    branch       = "main"
  },
  portefaix-aws-staging-observability = {
    project_root = "terraform/aws/observability/staging"
    labels       = ["core", "stack", "observability"]
    environment  = "staging"
    branch       = "main"
  },
  portefaix-aws-staging-notifications = {
    project_root = "terraform/aws/notifications/staging"
    labels       = ["core", "stack", "notifications"]
    environment  = "staging"
    branch       = "main"
  },
  portefaix-aws-staging-external-dns = {
    project_root = "terraform/aws/external-dns/staging"
    labels       = ["core", "stack", "externaldns"]
    environment  = "staging"
    branch       = "main"
  },
  portefaix-aws-staging-bastion = {
    project_root = "terraform/aws/bastion/staging"
    labels       = ["core", "bastion"]
    environment  = "staging"
    branch       = "main"
  },
  portefaix-aws-staging-waf = {
    project_root = "terraform/aws/waf/staging"
    labels       = ["core", "security", "waf"]
    environment  = "staging"
    branch       = "main"
  },
  portefaix-aws-staging-secrets = {
    project_root = "terraform/aws/secrets/staging"
    labels       = ["core", "security", "secrets"]
    environment  = "staging"
    branch       = "main"
  },
}
