output "vpc_id" {
  description = "ID of the spoke VPC."
  value       = scaleway_vpc.this.id
}

output "private_network_id" {
  description = "ID of the spoke Private Network."
  value       = scaleway_vpc_private_network.this.id
}

output "subnet_cidr" {
  description = "IPv4 subnet CIDR of the spoke Private Network."
  value       = var.subnet_cidr
}

output "connector_id" {
  description = "ID of the VPC Connector to the hub, if created."
  value       = try(scaleway_vpc_connector.hub[0].id, null)
}
