resource "google_iam_workload_identity_pool" "github_actions_network" {
  provider = google.network

  workload_identity_pool_id = "github-actions-network"
  display_name              = format("Github Actions Pool")
  description               = "Identity pool for Github Actions Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "github_actions_network" {
  provider = google.network

  workload_identity_pool_id          = google_iam_workload_identity_pool.github_actions_network.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions-network"
  display_name                       = "Github Actions Pool Provider"
  description                        = "OIDC identity pool provider for Github Actions Dynamic Credentials integration"

  attribute_mapping   = local.github_actions_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.github_actions_uri
  }
}

resource "google_iam_workload_identity_pool" "github_actions_shared" {
  provider = google.shared

  workload_identity_pool_id = "github-actions-shared"
  display_name              = format("Github Actions Pool")
  description               = "Identity pool for Github Actions Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "github_actions_shared" {
  provider = google.shared

  workload_identity_pool_id          = google_iam_workload_identity_pool.github_actions_shared.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions-shared"
  display_name                       = "Github Actions Pool Provider"
  description                        = "OIDC identity pool provider for Github Actions Dynamic Credentials integration"

  attribute_mapping   = local.github_actions_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.github_actions_uri
  }
}

resource "google_iam_workload_identity_pool" "github_actions_logging" {
  provider = google.logging

  workload_identity_pool_id = "github-actions-logging"
  display_name              = format("Github Actions Pool")
  description               = "Identity pool for Github Actions Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "github_actions_logging" {
  provider = google.logging

  workload_identity_pool_id          = google_iam_workload_identity_pool.github_actions_logging.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions-logging"
  display_name                       = "Github Actions Pool Provider"
  description                        = "OIDC identity pool provider for Github Actions Dynamic Credentials integration"

  attribute_mapping   = local.github_actions_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.github_actions_uri
  }
}

resource "google_iam_workload_identity_pool" "github_actions_testing" {
  provider = google.testing

  workload_identity_pool_id = "github-actions-testing"
  display_name              = format("Github Actions Pool")
  description               = "Identity pool for Github Actions Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "github_actions_testing" {
  provider = google.testing

  workload_identity_pool_id          = google_iam_workload_identity_pool.github_actions_testing.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions-testing"
  display_name                       = "Github Actions Pool Provider"
  description                        = "OIDC identity pool provider for Github Actions Dynamic Credentials integration"

  attribute_mapping   = local.github_actions_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.github_actions_uri
  }
}

resource "google_iam_workload_identity_pool" "github_actions_audit" {
  provider = google.audit

  workload_identity_pool_id = "github-actions-audit"
  display_name              = format("Github Actions Pool")
  description               = "Identity pool for Github Actions Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "github_actions_audit" {
  provider = google.audit

  workload_identity_pool_id          = google_iam_workload_identity_pool.github_actions_audit.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions-audit"
  display_name                       = "Github Actions Pool Provider"
  description                        = "OIDC identity pool provider for Github Actions Dynamic Credentials integration"

  attribute_mapping   = local.github_actions_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.github_actions_uri
  }
}

resource "google_iam_workload_identity_pool" "github_actions_core_dev" {
  provider = google.core_dev

  workload_identity_pool_id = "github-actions-core-dev"
  display_name              = format("Github Actions Pool")
  description               = "Identity pool for Github Actions Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "github_actions_core_dev" {
  provider = google.core_dev

  workload_identity_pool_id          = google_iam_workload_identity_pool.github_actions_core_dev.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions-core-dev"
  display_name                       = "Github Actions Pool Provider"
  description                        = "OIDC identity pool provider for Github Actions Dynamic Credentials integration"

  attribute_mapping   = local.github_actions_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.github_actions_uri
  }
}
