output "project_ids" {
  description = "Scaleway Project ID of each environment."
  value       = { for env, project in scaleway_account_project.this : env => project.id }
}

output "network_project_id" {
  description = "Scaleway Project ID of the network project."
  value       = scaleway_account_project.network.id
}

output "admin_group_id" {
  description = "ID of the Portefaix administrators IAM group."
  value       = scaleway_iam_group.administrators.id
}

output "spacelift_application_id" {
  description = "ID of the Spacelift IAM application."
  value       = scaleway_iam_application.spacelift.id
}
