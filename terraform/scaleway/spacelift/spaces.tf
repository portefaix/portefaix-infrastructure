resource "spacelift_space" "this" {
  name            = var.space
  parent_space_id = data.spacelift_space.this.id
  description     = "Created by Terraform."
  labels          = local.labels
}

resource "spacelift_space" "environment" {
  for_each = toset(var.environments)

  name            = format("%s-%s", var.space, each.value)
  parent_space_id = spacelift_space.this.id
  description     = "Created by Terraform."
  labels          = concat(local.labels, [each.value])
}
