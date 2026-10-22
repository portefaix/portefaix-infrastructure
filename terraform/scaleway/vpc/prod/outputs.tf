output "vpc_id" {
  description = "ID of the spoke VPC."
  value       = module.vpc.vpc_id
}

output "private_network_id" {
  description = "ID of the spoke Private Network."
  value       = module.vpc.private_network_id
}

output "connector_id" {
  description = "ID of the VPC Connector to the hub, if created."
  value       = module.vpc.connector_id
}
