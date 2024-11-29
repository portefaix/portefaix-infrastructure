module "sa_tf_bootstrap" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "4.4.2"

  providers = {
    google = google.bootstrap
  }

  project_id = var.network_project_id

  names = [
    format("%s-bootstrap", local.sa_name)
  ]

  project_roles = [
    format("%s=>roles/owner", var.bootstrap_project_id),
  ]
}

module "sa_tf_network" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "4.4.2"

  providers = {
    google = google.network
  }

  project_id = var.network_project_id

  names = [
    format("%s-network", local.sa_name)
  ]

  project_roles = [
    format("%s=>roles/owner", var.network_project_id),
  ]
}

