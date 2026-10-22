output "vpc_id" {
  description = "ID of the hub VPC. Copy this into the dev/staging/prod stacks' tfvars as hub_vpc_id."
  value       = scaleway_vpc.this.id
}

output "private_network_ids" {
  description = "IDs of the hub Private Networks."
  value = {
    transit         = scaleway_vpc_private_network.transit.id
    shared_services = scaleway_vpc_private_network.shared_services.id
    management      = scaleway_vpc_private_network.management.id
  }
}

output "public_gateway_id" {
  description = "ID of the hub Public Gateway, if created."
  value       = try(scaleway_vpc_public_gateway.this[0].id, null)
}
