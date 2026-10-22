resource "scaleway_iam_group" "administrators" {
  name                = var.admin_group_name
  description         = "Portefaix organization administrators."
  tags                = local.labels
  external_membership = true
}

resource "scaleway_iam_policy" "administrators" {
  name        = format("%s-policy", var.admin_group_name)
  description = "Full access to every Portefaix environment Project."
  group_id    = scaleway_iam_group.administrators.id

  rule {
    project_ids          = local.all_project_ids
    permission_set_names = ["AllProductsFullAccess"]
  }

  # Billing is an Organization-level resource (no project_id), so it can
  # only be granted through an organization_id-scoped rule.
  rule {
    organization_id      = scaleway_iam_group.administrators.organization_id
    permission_set_names = ["BillingManager"]
  }
}

resource "scaleway_iam_application" "spacelift" {
  name        = var.spacelift_application_name
  description = "Spacelift robot identity used to manage the Portefaix Scaleway environment Projects."
  tags        = local.labels
}

resource "scaleway_iam_policy" "spacelift" {
  name           = format("%s-policy", var.spacelift_application_name)
  description    = "Access granted to Spacelift to manage every Portefaix environment Project."
  application_id = scaleway_iam_application.spacelift.id

  rule {
    project_ids          = local.all_project_ids
    permission_set_names = var.spacelift_permission_set_names
  }

  # Billing is an Organization-level resource (no project_id), so it can
  # only be granted through an organization_id-scoped rule.
  rule {
    organization_id      = scaleway_iam_application.spacelift.organization_id
    permission_set_names = ["BillingManager"]
  }
}
