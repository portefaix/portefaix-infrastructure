locals {
  labels = ["scaleway", "root", "portefaix"]

  all_project_ids = concat(
    [for project in scaleway_account_project.this : project.id],
    [scaleway_account_project.network.id],
  )
}
