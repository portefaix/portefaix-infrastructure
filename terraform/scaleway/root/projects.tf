resource "scaleway_account_project" "this" {
  for_each = toset(var.environments)

  name        = format("%s-%s", var.project_prefix, each.value)
  description = format("Portefaix %s environment, managed by Terraform.", each.value)
}

resource "scaleway_account_project" "network" {
  name        = format("%s-%s", var.project_prefix, var.network_project_name)
  description = "Portefaix network project, hosts the hub VPC, managed by Terraform."
}
