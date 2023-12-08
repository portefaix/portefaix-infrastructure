resource "google_iam_workload_identity_pool" "tfcloud_network" {
  provider = google.network

  workload_identity_pool_id = "tfcloud-network"
  display_name              = format("Terraform Cloud Pool")
  description               = "Identity pool for Terraform Cloud Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_network" {
  provider = google.network

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_network.workload_identity_pool_id
  workload_identity_pool_provider_id = "tfcloud-network"
  display_name                       = "Terraform Cloud Pool Provider"
  description                        = "OIDC identity pool provider for Terraform Cloud Dynamic Credentials integration"

  # Use condition to make sure only token generated for a specific TFC Org can be used across org workspaces
  attribute_condition = local.tfcloud_attribute_condition
  attribute_mapping   = local.tfcloud_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.tfcloud_uri
  }
}

resource "google_iam_workload_identity_pool" "tfcloud_shared" {
  provider = google.shared

  workload_identity_pool_id = "tfcloud-shared"
  display_name              = format("Terraform Cloud Pool")
  description               = "Identity pool for Terraform Cloud Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_shared" {
  provider = google.shared

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_shared.workload_identity_pool_id
  workload_identity_pool_provider_id = "tfcloud-shared"
  display_name                       = "Terraform Cloud Pool Provider"
  description                        = "OIDC identity pool provider for Terraform Cloud Dynamic Credentials integration"

  # Use condition to make sure only token generated for a specific TFC Org can be used across org workspaces
  attribute_condition = local.tfcloud_attribute_condition
  attribute_mapping   = local.tfcloud_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.tfcloud_uri
  }
}

resource "google_iam_workload_identity_pool" "tfcloud_logging" {
  provider = google.logging

  workload_identity_pool_id = "tfcloud-logging"
  display_name              = format("Terraform Cloud Pool")
  description               = "Identity pool for Terraform Cloud Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_logging" {
  provider = google.logging

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_logging.workload_identity_pool_id
  workload_identity_pool_provider_id = "tfcloud-logging"
  display_name                       = "Terraform Cloud Pool Provider"
  description                        = "OIDC identity pool provider for Terraform Cloud Dynamic Credentials integration"

  # Use condition to make sure only token generated for a specific TFC Org can be used across org workspaces
  attribute_condition = local.tfcloud_attribute_condition
  attribute_mapping   = local.tfcloud_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.tfcloud_uri
  }
}

resource "google_iam_workload_identity_pool" "tfcloud_testing" {
  provider = google.testing

  workload_identity_pool_id = "tfcloud-testing"
  display_name              = format("Terraform Cloud Pool")
  description               = "Identity pool for Terraform Cloud Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_testing" {
  provider = google.testing

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_testing.workload_identity_pool_id
  workload_identity_pool_provider_id = "tfcloud-testing"
  display_name                       = "Terraform Cloud Pool Provider"
  description                        = "OIDC identity pool provider for Terraform Cloud Dynamic Credentials integration"

  # Use condition to make sure only token generated for a specific TFC Org can be used across org workspaces
  attribute_condition = local.tfcloud_attribute_condition
  attribute_mapping   = local.tfcloud_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.tfcloud_uri
  }
}

resource "google_iam_workload_identity_pool" "tfcloud_audit" {
  provider = google.audit

  workload_identity_pool_id = "tfcloud-audit"
  display_name              = format("Terraform Cloud Pool")
  description               = "Identity pool for Terraform Cloud Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_audit" {
  provider = google.audit

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_audit.workload_identity_pool_id
  workload_identity_pool_provider_id = "tfcloud-audit"
  display_name                       = "Terraform Cloud Pool Provider"
  description                        = "OIDC identity pool provider for Terraform Cloud Dynamic Credentials integration"

  # Use condition to make sure only token generated for a specific TFC Org can be used across org workspaces
  attribute_condition = local.tfcloud_attribute_condition
  attribute_mapping   = local.tfcloud_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.tfcloud_uri
  }
}

resource "google_iam_workload_identity_pool" "tfcloud_core_dev" {
  provider = google.core_dev

  workload_identity_pool_id = "tfcloud-core-dev"
  display_name              = format("Terraform Cloud Pool")
  description               = "Identity pool for Terraform Cloud Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_core_dev" {
  provider = google.core_dev

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_core_dev.workload_identity_pool_id
  workload_identity_pool_provider_id = "tfcloud-core-dev"
  display_name                       = "Terraform Cloud Pool Provider"
  description                        = "OIDC identity pool provider for Terraform Cloud Dynamic Credentials integration"

  # Use condition to make sure only token generated for a specific TFC Org can be used across org workspaces
  attribute_condition = local.tfcloud_attribute_condition
  attribute_mapping   = local.tfcloud_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.tfcloud_uri
  }
}
