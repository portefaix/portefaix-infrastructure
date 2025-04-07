module "hub" {
  source = "../modules/hub"

  hub_name          = var.hub_name
  resource_group_id = var.resource_group_name
  region            = var.region

  network_acls         = var.network_acls_hub
  subnets              = var.hub_subnets
  security_group_rules = var.security_group_rules_hub
}
