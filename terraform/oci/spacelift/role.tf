resource "spacelift_role" "stack_creator" {
  name        = "Stack creator"
  description = "A role solely for managing stacks"
  actions     = ["STACK_MANAGE"]
}

# resource "spacelift_role_attachment" "stack_creator_to_stack" {
#   for_each = var.stacks

#   stack_id = spacelift_stack.this[each.key].id
#   role_id  = spacelift_role.stack_creator.id
#   space_id = spacelift_space.environment[each.value.environment].id #
# }
