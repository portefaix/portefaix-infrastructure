#####################################################################
# Provider

region = "fr-par"

zone = "fr-par-1"

#####################################################################
# Spoke VPC

name = "portefaix-staging"

project_id = "ef87445b-8c5a-4a3e-b807-9d06fe2ab755"

subnet_cidr = "10.2.0.0/24"

tags = ["terraform", "portefaix", "staging"]

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
  "10.3.0.0/24", # prod
]
