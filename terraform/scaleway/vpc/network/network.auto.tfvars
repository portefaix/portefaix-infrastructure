#####################################################################
# Provider

region = "fr-par"

zone = "fr-par-1"

#####################################################################
# Hub

name = "portefaix-hub"

project_id = "07f302eb-e91f-4c7d-872f-4125ef02b927"

subnet_cidrs = {
  transit         = "10.0.0.0/24"
  shared_services = "10.0.1.0/24"
  management      = "10.0.2.0/24"
}

enable_public_gateway = true

public_gateway_type = "VPC-GW-S"
