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

module "network" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.4.0"

  name              = format("%s-network", var.organization_name)
  random_project_id = true
  org_id            = data.google_organization.this.id
  billing_account   = var.billing_account
  folder_id         = module.folders.folders_map["Shared"].id

  default_service_account        = "deprivilege"
  enable_shared_vpc_host_project = true
  default_network_tier           = var.default_network_tier

  activate_apis = [
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "logging.googleapis.com",
    "cloudbilling.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  # budget_amount               = var.network_budget_amount
  # budget_alert_pubsub_topic   = module.pubsub.id # var.network_budget_alert_pubsub_topic
  # budget_alert_spent_percents = var.network_budget_alert_spent_percents

  labels = merge({
    service     = "network"
    environment = "shared"
  }, var.labels)
}

module "vpc_core_prod" {
  source  = "terraform-google-modules/network/google"
  version = "8.1.0"

  project_id                             = module.network.project_id
  network_name                           = format("%s-prod", var.core_network_name)
  delete_default_internet_gateway_routes = true

  subnets          = var.subnets["prod"]
  secondary_ranges = var.secondary_ranges["prod"]
}

module "vpc_core_staging" {
  source  = "terraform-google-modules/network/google"
  version = "8.1.0"

  project_id                             = module.network.project_id
  network_name                           = format("%s-staging", var.core_network_name)
  delete_default_internet_gateway_routes = true

  subnets          = var.subnets["staging"]
  secondary_ranges = var.secondary_ranges["staging"]
}

module "vpc_core_dev" {
  source  = "terraform-google-modules/network/google"
  version = "8.1.0"

  project_id                             = module.network.project_id
  network_name                           = format("%s-dev", var.core_network_name)
  delete_default_internet_gateway_routes = true

  subnets          = var.subnets["dev"]
  secondary_ranges = var.secondary_ranges["dev"]
}

module "shared" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "14.4.0"

  name                    = format("%s-shared", var.organization_name)
  random_project_id       = true
  default_service_account = "deprivilege"

  org_id          = data.google_organization.this.id
  billing_account = var.billing_account
  folder_id       = module.folders.folders_map["Shared"].id

  activate_apis = [
    "logging.googleapis.com",
    "pubsub.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  shared_vpc = module.network.project_id
  shared_vpc_subnets = concat(
    module.vpc_core_prod.subnets_self_links,
    module.vpc_core_staging.subnets_self_links,
    module.vpc_core_dev.subnets_self_links
  )

  labels = merge({
    service     = "shared"
    environment = "shared"
  }, var.labels)
}

module "testing" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "14.4.0"

  name                    = format("%s-testing", var.organization_name)
  random_project_id       = true
  default_service_account = "deprivilege"

  org_id          = data.google_organization.this.id
  billing_account = var.billing_account
  folder_id       = module.folders.folders_map["Shared"].id

  activate_apis = [
    "logging.googleapis.com",
    "pubsub.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  shared_vpc = module.network.project_id
  shared_vpc_subnets = concat(
    module.vpc_core_prod.subnets_self_links,
    module.vpc_core_staging.subnets_self_links,
    module.vpc_core_dev.subnets_self_links
  )

  # budget_alert_pubsub_topic   = var.org_testing_logs_project_alert_pubsub_topic
  # budget_alert_spent_percents = var.org_testing_logs_project_alert_spent_percents

  labels = merge({
    service     = "testing"
    environment = "shared"
  }, var.labels)
}

module "audit" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "14.4.0"

  name                    = format("%s-audit", var.organization_name)
  random_project_id       = true
  default_service_account = "deprivilege"

  org_id          = data.google_organization.this.id
  billing_account = var.billing_account
  folder_id       = module.folders.folders_map["Security"].id

  activate_apis = [
    "logging.googleapis.com",
    "pubsub.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  shared_vpc = module.network.project_id
  shared_vpc_subnets = concat(
    module.vpc_core_prod.subnets_self_links,
    module.vpc_core_staging.subnets_self_links,
    module.vpc_core_dev.subnets_self_links
  )

  labels = merge({
    service     = "audit"
    environment = "security"
  }, var.labels)
}

module "logging" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "14.4.0"

  name                    = format("%s-logging", var.organization_name)
  random_project_id       = true
  default_service_account = "deprivilege"

  org_id          = data.google_organization.this.id
  billing_account = var.billing_account
  folder_id       = module.folders.folders_map["Shared"].id

  activate_apis = [
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "pubsub.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  shared_vpc = module.network.project_id
  shared_vpc_subnets = concat(
    module.vpc_core_prod.subnets_self_links,
    module.vpc_core_staging.subnets_self_links,
    module.vpc_core_dev.subnets_self_links
  )

  # budget_amount = var.logging_budget_amount
  # budget_alert_pubsub_topic   = var.logging_budget_alert_pubsub_topic
  # budget_alert_spent_percents = var.logging_budget_alert_spent_percents

  labels = merge({
    service     = "logging"
    environment = "shared"
  }, var.labels)
}


module "core" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "14.4.0"

  for_each = toset(var.core_environments)

  name                    = format("%s-core-%s", var.organization_name, each.key)
  random_project_id       = true
  default_service_account = "deprivilege"

  org_id          = data.google_organization.this.id
  billing_account = var.billing_account
  folder_id       = module.folders.folders_map["Core"].id

  activate_apis = [
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "containerregistry.googleapis.com",
    "containersecurity.googleapis.com",
    "artifactregistry.googleapis.com",
    "secretmanager.googleapis.com",
    "dns.googleapis.com",
    "cloudkms.googleapis.com",
    "iap.googleapis.com",
    "logging.googleapis.com",
    "pubsub.googleapis.com",
    "iamcredentials.googleapis.com",
    "sts.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  shared_vpc = module.network.project_id
  shared_vpc_subnets = concat(
    module.vpc_core_prod.subnets_self_links,
    module.vpc_core_staging.subnets_self_links,
    module.vpc_core_dev.subnets_self_links
  )

  labels = merge({
    service     = format("%s-core-%s", var.organization_name, each.key)
    environment = each.key
  }, var.labels)
}
