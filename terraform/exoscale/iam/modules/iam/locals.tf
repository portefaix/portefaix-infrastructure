locals {
  service_name    = format("%s-%s", var.organization, var.environment)
  admin_role_name = format("%s-admin", local.service_name)
}
