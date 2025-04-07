resource "google_iam_workload_identity_pool" "tfcloud_bootstrap" {
  provider = google.bootstrap

  workload_identity_pool_id = format("%s-tfcloud-bootstrap", var.tfcloud_organization_id)
  display_name              = title(local.tfcloud_service)
  description               = local.tfcloud_wip_desc
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_bootstrap" {
  provider = google.bootstrap

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_bootstrap.workload_identity_pool_id
  workload_identity_pool_provider_id = format("%s-tfcloud-bootstrap", var.tfcloud_organization_id)
  display_name                       = title(local.tfcloud_service)
  description                        = local.tfcloud_wip_provider_desc

  # Use condition to make sure only token generated for a specific TFC Org can be used across org workspaces
  attribute_condition = local.tfcloud_attribute_condition
  attribute_mapping   = local.tfcloud_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.tfcloud_uri
  }
}

resource "google_iam_workload_identity_pool" "tfcloud_network" {
  provider = google.network

  workload_identity_pool_id = format("%s-tfcloud-network", var.tfcloud_organization_id)
  display_name              = title(local.tfcloud_service)
  description               = local.tfcloud_wip_desc
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_network" {
  provider = google.network

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_network.workload_identity_pool_id
  workload_identity_pool_provider_id = format("%s-tfcloud-network", var.tfcloud_organization_id)
  display_name                       = title(local.tfcloud_service)
  description                        = local.tfcloud_wip_provider_desc

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

  workload_identity_pool_id = format("%s-tfcloud-shared", var.tfcloud_organization_id)
  display_name              = title(local.tfcloud_service)
  description               = local.tfcloud_wip_desc
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_shared" {
  provider = google.shared

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_shared.workload_identity_pool_id
  workload_identity_pool_provider_id = format("%s-tfcloud-shared", var.tfcloud_organization_id)
  display_name                       = title(local.tfcloud_service)
  description                        = local.tfcloud_wip_provider_desc

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

  workload_identity_pool_id = format("%s-tfcloud-logging", var.tfcloud_organization_id)
  display_name              = title(local.tfcloud_service)
  description               = local.tfcloud_wip_desc
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_logging" {
  provider = google.logging

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_logging.workload_identity_pool_id
  workload_identity_pool_provider_id = format("%s-tfcloud-logging", var.tfcloud_organization_id)
  display_name                       = title(local.tfcloud_service)
  description                        = local.tfcloud_wip_provider_desc

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

  workload_identity_pool_id = format("%s-tfcloud-testing", var.tfcloud_organization_id)
  display_name              = title(local.tfcloud_service)
  description               = local.tfcloud_wip_desc
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_testing" {
  provider = google.testing

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_testing.workload_identity_pool_id
  workload_identity_pool_provider_id = format("%s-tfcloud-testing", var.tfcloud_organization_id)
  display_name                       = title(local.tfcloud_service)
  description                        = local.tfcloud_wip_provider_desc

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

  workload_identity_pool_id = format("%s-tfcloud-audit", var.tfcloud_organization_id)
  display_name              = title(local.tfcloud_service)
  description               = local.tfcloud_wip_desc
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_audit" {
  provider = google.audit

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_audit.workload_identity_pool_id
  workload_identity_pool_provider_id = format("%s-tfcloud-audit", var.tfcloud_organization_id)
  display_name                       = title(local.tfcloud_service)
  description                        = local.tfcloud_wip_provider_desc

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

  workload_identity_pool_id = format("%s-tfcloud-core-dev", var.tfcloud_organization_id)
  display_name              = title(local.tfcloud_service)
  description               = local.tfcloud_wip_desc
}

resource "google_iam_workload_identity_pool_provider" "tfcloud_core_dev" {
  provider = google.core_dev

  workload_identity_pool_id          = google_iam_workload_identity_pool.tfcloud_core_dev.workload_identity_pool_id
  workload_identity_pool_provider_id = format("%s-tfcloud-core-dev", var.tfcloud_organization_id)
  display_name                       = title(local.tfcloud_service)
  description                        = local.tfcloud_wip_provider_desc

  # Use condition to make sure only token generated for a specific TFC Org can be used across org workspaces
  attribute_condition = local.tfcloud_attribute_condition
  attribute_mapping   = local.tfcloud_attribute_mapping
  
  oidc {
    # Should be different if self hosted TFE instance is used
    issuer_uri = var.tfcloud_uri
  }
}
