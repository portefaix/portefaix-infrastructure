module "spoke_vpc" {
  source  = "terraform-ibm-modules/landing-zone-vpc/ibm"
  version = "7.22.7"

  name              = local.vpc_name
  prefix            = local.prefix
  resource_group_id = data.ibm_resource_group.core.id
  region            = var.region

  address_prefixes = {
    zone-1 = ["10.${index(var.spoke_environments, each.key) + 20}.10.0/24"],
    zone-2 = ["10.${index(var.spoke_environments, each.key) + 20}.20.0/24"],
    zone-3 = ["10.${index(var.spoke_environments, each.key) + 20}.30.0/24"]
  }
  network_acls         = var.network_acls
  subnets              = var.subnets
  use_public_gateways  = { zone-1 = true, zone-2 = true, zone-3 = true }
  security_group_rules = var.security_group_rules
}
