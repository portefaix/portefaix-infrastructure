resource "spacelift_stack" "this" {
  for_each = var.stacks

  autodeploy                      = false
  branch                          = each.value.branch
  description                     = "created by Terraform"
  name                            = each.key
  project_root                    = format("%s/%s", each.value.project_root, each.value.environment)
  space_id                        = spacelift_space.environment[each.value.environment].id
  protect_from_deletion           = false
  manage_state                    = true
  terraform_external_state_access = true
  terraform_workflow_tool         = "OPEN_TOFU"
  repository                      = var.repository
  labels                          = concat(local.labels, each.value.labels, [each.value.environment])
  additional_project_globs = [
    format("%s/modules/*", each.value.project_root)
  ]
}

resource "spacelift_context_attachment" "this" {
  for_each = var.stacks

  context_id = spacelift_context.this[each.value.environment].id
  stack_id   = spacelift_stack.this[each.key].id
  priority   = 0
}

resource "spacelift_stack_dependency" "this" {
  for_each = tomap({
    for dep in local.stack_dependencies : "${dep.stack_name}.${dep.dependency_name}" => dep
  })

  stack_id            = spacelift_stack.this[each.value.stack_name].id
  depends_on_stack_id = spacelift_stack.this[each.value.dependency_name].id
}
