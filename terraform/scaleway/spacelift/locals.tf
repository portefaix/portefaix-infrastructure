locals {
  cloud_provider = "scaleway"
  labels         = [local.cloud_provider]

  stack_dependencies = flatten([
    for stack_key, stack in var.stacks : [
      for dependency in stack.dependencies : {
        stack_name      = stack_key
        dependency_name = dependency
      }
    ]
  ])
}
