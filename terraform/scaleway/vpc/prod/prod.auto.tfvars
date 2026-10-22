#####################################################################
# Provider

region = "fr-par"

zone = "fr-par-1"

#####################################################################
# Spoke VPC

name = "portefaix-prod"

project_id = "fffdabb6-bf38-4ba9-bf39-48c2bb748d4b"

subnet_cidr = "10.3.0.0/24"

tags = ["terraform", "portefaix", "prod"]

#####################################################################
# Hub connectivity

# TODO: copy the `vpc_id` output from terraform/scaleway/vpc/hub
# once it has been applied.
hub_vpc_id = ""

#####################################################################
# ACL / isolation

create_acl = true

deny_cidrs = [
  "10.1.0.0/24", # dev
  "10.2.0.0/24", # staging
]
