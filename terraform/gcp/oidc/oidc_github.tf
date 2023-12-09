module "gh_oidc_network" {
  source  = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version = "v3.1.2"

  providers = {
    google = google.network
    google-beta = google-beta.network
  }

  project_id = var.network_project_id

  pool_id           = format("%s-gha-network", var.tfcloud_organization_id)
  pool_display_name = title(local.gh_actions_service)
  pool_description  = local.gh_actions_wip_desc

  provider_id       = format("%s-gha-network", var.tfcloud_organization_id)
  provider_display_name = title(local.gh_actions_service)
  provider_description = local.gh_actions_wip_provider_desc

  # equals to default value of the module
  # attribute_mapping = local.github_actions_attribute_mapping

  sa_mapping = {
    (module.sa_tf.service_account.account_id) = {
      attribute = "attribute.repository/${var.gh_owner}/${var.gh_repo_name}"
      sa_name   = module.sa_tf.service_account.name
    }
  }
}
