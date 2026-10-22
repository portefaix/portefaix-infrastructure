resource "spacelift_context" "this" {
  for_each = toset(var.environments)

  name        = format("scaleway-%s", each.value)
  space_id    = spacelift_space.environment[each.value].id
  description = "Created by Terraform"
  labels      = local.labels
}

resource "spacelift_environment_variable" "scw_access_key" {
  for_each = var.stacks

  name       = "SCW_ACCESS_KEY"
  context_id = spacelift_context.this[each.value.environment].id
  value      = var.scw_access_key
  write_only = true
}

resource "spacelift_environment_variable" "scw_secret_key" {
  for_each = var.stacks

  name       = "SCW_SECRET_KEY"
  context_id = spacelift_context.this[each.value.environment].id
  value      = var.scw_secret_key
  write_only = true
}

resource "spacelift_environment_variable" "scw_default_organization_id" {
  for_each = var.stacks

  name       = "SCW_DEFAULT_ORGANIZATION_ID"
  context_id = spacelift_context.this[each.value.environment].id
  value      = var.scw_default_organization_id
  write_only = true
}

resource "spacelift_environment_variable" "scw_default_project_id" {
  for_each = var.stacks

  name       = "SCW_DEFAULT_PROJECT_ID"
  context_id = spacelift_context.this[each.value.environment].id
  value      = var.scw_default_project_id
  write_only = true
}

resource "spacelift_environment_variable" "aws_acces_key_id" {
  for_each = var.stacks

  # context_id = spacelift_context.this.id
  context_id = spacelift_context.this[each.value.environment].id
  name       = "AWS_ACCESS_KEY_ID"
  value      = var.aws_access_key_id
  write_only = true
}

resource "spacelift_environment_variable" "aws_secret_access_key" {
  for_each = var.stacks

  # context_id = spacelift_context.this.id
  context_id = spacelift_context.this[each.value.environment].id
  name       = "AWS_SECRET_ACCESS_KEY"
  value      = var.aws_secret_access_key
  write_only = true
}

resource "spacelift_environment_variable" "aws_default_region" {
  for_each = var.stacks

  # context_id = spacelift_context.this.id
  context_id = spacelift_context.this[each.value.environment].id
  name       = "AWS_SECRET_ACCESS_KEY"
  value      = var.aws_default_region
  write_only = true
}

resource "spacelift_environment_variable" "project_id" {
  for_each = var.stacks

  name       = "TF_VAR_project_id"
  context_id = spacelift_context.this[each.value.environment].id
  value      = var.scw_project_id
  write_only = true
}
