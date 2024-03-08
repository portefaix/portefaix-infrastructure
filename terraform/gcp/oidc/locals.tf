locals {
  workload_identity_pool_desc = "Identity Pool for"
  workload_identity_pool_provider_desc = "OIDC identity pool provider for"

  tfcloud_service = "terraform-cloud"
  tfcloud_wip_desc = format("%s %s Pool", local.workload_identity_pool_desc, title(local.tfcloud_service))
  tfcloud_wip_provider_desc = format("%s %s", local.workload_identity_pool_provider_desc, title(local.tfcloud_service))
  tfcloud_attribute_condition = "attribute.terraform_organization_id == \"${var.tfcloud_organization_id}\""
  tfcloud_attribute_mapping = {
    "google.subject"                        = "assertion.sub"
    "attribute.aud"                         = "assertion.aud"
    "attribute.terraform_run_phase"         = "assertion.terraform_run_phase"
    "attribute.terraform_project_id"        = "assertion.terraform_project_id",
    "attribute.terraform_project_name"      = "assertion.terraform_project_name",
    "attribute.terraform_workspace_id"      = "assertion.terraform_workspace_id"
    "attribute.terraform_workspace_name"    = "assertion.terraform_workspace_name"
    "attribute.terraform_organization_id"   = "assertion.terraform_organization_id"
    "attribute.terraform_organization_name" = "assertion.terraform_organization_name"
    "attribute.terraform_run_id"            = "assertion.terraform_run_id"
    "attribute.terraform_full_workspace"    = "assertion.terraform_full_workspace"
  }

  gh_actions_service = "github-actions"
  gh_actions_wip_desc = format("%s %s Pool", local.workload_identity_pool_desc, title(local.gh_actions_service))
  gh_actions_wip_provider_desc = format("%s %s", local.workload_identity_pool_provider_desc, title(local.gh_actions_service))

  # github_actions_attribute_mapping = {
  #   "google.subject"       = "assertion.sub"
  #   "attribute.actor"      = "assertion.actor"
  #   "attribute.aud"        = "assertion.aud"
  #   "attribute.repository" = "assertion.repository"
  # }

  sa_name = "terraform"
}