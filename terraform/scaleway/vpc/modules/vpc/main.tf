resource "scaleway_vpc" "this" {
  name                = var.name
  project_id          = var.project_id
  enable_transitivity = var.enable_transitivity
  tags                = var.tags
}

resource "scaleway_vpc_private_network" "this" {
  name       = var.name
  project_id = var.project_id
  vpc_id     = scaleway_vpc.this.id
  tags       = var.tags

  ipv4_subnet {
    subnet = var.subnet_cidr
  }
}

resource "scaleway_vpc_connector" "hub" {
  count = var.hub_vpc_id != null ? 1 : 0

  name          = format("%s-to-hub", var.name)
  vpc_id        = scaleway_vpc.this.id
  target_vpc_id = var.hub_vpc_id
  tags          = var.tags
}

resource "scaleway_vpc_acl" "this" {
  count = var.create_acl ? 1 : 0

  vpc_id         = scaleway_vpc.this.id
  default_policy = var.acl_default_policy
  is_ipv6        = false

  dynamic "rules" {
    for_each = var.deny_cidrs
    content {
      action      = "drop"
      protocol    = "ANY"
      source      = rules.value
      destination = var.subnet_cidr
      description = format("Deny inbound from sibling spoke %s", rules.value)
    }
  }

  dynamic "rules" {
    for_each = var.deny_cidrs
    content {
      action      = "drop"
      protocol    = "ANY"
      source      = var.subnet_cidr
      destination = rules.value
      description = format("Deny outbound to sibling spoke %s", rules.value)
    }
  }
}
