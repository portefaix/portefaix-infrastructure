module "gh_oidc_bootstrap" {
  source  = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version = "v5.1.0"

  providers = {
    google = google.bootstrap
    google-beta = google-beta.bootstrap
  }

  project_id = var.bootstrap_project_id

  pool_id           = format("%s-gha-bootstrap", var.tfcloud_organization_id)
  pool_display_name = title(local.gh_actions_service)
  pool_description  = local.gh_actions_wip_desc

  provider_id       = format("%s-gha-bootstrap", var.tfcloud_organization_id)
  provider_display_name = title(local.gh_actions_service)
  provider_description = local.gh_actions_wip_provider_desc

  # equals to default value of the module
  # attribute_mapping = local.github_actions_attribute_mapping

  sa_mapping = {
    # (module.sa_tf_bootstrap.service_account.account_id) = {
    "terraform-bootstrap" = {
      attribute = "attribute.repository/${var.gh_owner}/${var.gh_repo_name}"
      sa_name   = module.sa_tf_bootstrap.service_account.name
    }
    # (module.sa_tf_network.service_account.account_id) = {
    "terraform-network" = {
      attribute = "attribute.repository/${var.gh_owner}/${var.gh_repo_name}"
      sa_name   = module.sa_tf_network.service_account.name
    }
  }
}
