#####################################################################
# Provider

region = "fr-par"

zone = "fr-par-1"

#####################################################################
# Spoke VPC

name = "portefaix-dev"

project_id = "abb0fa78-5b9b-4cf8-abb5-a6867092751e"

subnet_cidr = "10.1.0.0/24"

tags = ["terraform", "portefaix", "dev"]

#####################################################################
# Hub connectivity

# TODO: copy the `vpc_id` output from terraform/scaleway/vpc/hub
# once it has been applied.
hub_vpc_id = ""

#####################################################################
# ACL / isolation

create_acl = true

deny_cidrs = [
  "10.2.0.0/24", # staging
  "10.3.0.0/24", # prod
]
