resource "scaleway_vpc" "this" {
  name       = var.name
  project_id = var.project_id
  tags       = var.tags
}

resource "scaleway_vpc_private_network" "transit" {
  name       = format("%s-transit", var.name)
  project_id = var.project_id
  vpc_id     = scaleway_vpc.this.id
  tags       = concat(var.tags, ["transit"])

  ipv4_subnet {
    subnet = var.subnet_cidrs["transit"]
  }
}

resource "scaleway_vpc_private_network" "shared_services" {
  name       = format("%s-shared-services", var.name)
  project_id = var.project_id
  vpc_id     = scaleway_vpc.this.id
  tags       = concat(var.tags, ["shared-services"])

  ipv4_subnet {
    subnet = var.subnet_cidrs["shared_services"]
  }
}

resource "scaleway_vpc_private_network" "management" {
  name       = format("%s-management", var.name)
  project_id = var.project_id
  vpc_id     = scaleway_vpc.this.id
  tags       = concat(var.tags, ["management"])

  ipv4_subnet {
    subnet = var.subnet_cidrs["management"]
  }
}

resource "scaleway_vpc_public_gateway" "this" {
  count = var.enable_public_gateway ? 1 : 0

  name = var.name
  type = var.public_gateway_type
  tags = var.tags
}

resource "scaleway_vpc_gateway_network" "transit" {
  count = var.enable_public_gateway ? 1 : 0

  gateway_id         = scaleway_vpc_public_gateway.this[0].id
  private_network_id = scaleway_vpc_private_network.transit.id
  enable_masquerade  = true

  ipam_config {
    push_default_route = true
  }
}
