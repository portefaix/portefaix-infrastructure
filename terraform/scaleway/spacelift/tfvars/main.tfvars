#####################################################################""
# Provider

region = "fr-par"

zone = "fr-par-1"

##############################################################################
# Spacelift

repository = "portefaix-infrastructure"

space = "scaleway"

environments = ["dev", "staging", "prod"]

stacks = {

  # Network

  portefaix-scaleway-network-vpc = {
    project_root = "terraform/scaleway/vpc"
    labels       = ["core", "vpc"]
    environment  = "network"
    branch       = "main"
    dependencies = []
  },

  # Core Dev

  portefaix-scaleway-dev-vpc = {
    project_root = "terraform/scaleway/vpc"
    labels       = ["core", "vpc"]
    environment  = "dev"
    branch       = "main"
    dependencies = []
  },

  # Core Staging

  portefaix-scaleway-staging-vpc = {
    project_root = "terraform/scaleway/vpc"
    labels       = ["core", "vpc"]
    environment  = "staging"
    branch       = "main"
    dependencies = []
  },

  # Core Prod

  portefaix-scaleway-prod-vpc = {
    project_root = "terraform/scaleway/vpc"
    labels       = ["core", "vpc"]
    environment  = "prod"
    branch       = "main"
    dependencies = []
  },
}
