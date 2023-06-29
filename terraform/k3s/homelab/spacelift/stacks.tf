resource "spacelift_stack" "this" {
  for_each = var.stacks

  administrative    = true
  autodeploy        = true
  branch            = "main"
  description       = "created by Terraform"
  name              = each.key
  project_root      = data.spacelift_space.this.id
  repository        = "core-infra"
}