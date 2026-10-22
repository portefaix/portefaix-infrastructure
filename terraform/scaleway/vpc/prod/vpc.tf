module "vpc" {
  source = "../modules/vpc"

  name                = var.name
  project_id          = var.project_id
  subnet_cidr         = var.subnet_cidr
  tags                = var.tags
  enable_transitivity = var.enable_transitivity

  hub_vpc_id = var.hub_vpc_id

  create_acl         = var.create_acl
  acl_default_policy = var.acl_default_policy
  deny_cidrs         = var.deny_cidrs
}
