module "transit_gateway" {
  source  = "terraform-ibm-modules/transit-gateway/ibm"
  version = "2.5.0"

  resource_group_id = data.ibm_resource_group.rg.id
  region            = var.region
  name              = "${var.name_prefix}-tgw-${var.environment}"

  connections = concat(
    [{
      vpc_id       = var.hub_vpc_id
      network_type = "vpc"
      name         = "${var.name_prefix}-hub-connection"
    }],
    [for idx, vpc_id in var.spoke_vpc_ids : {
      vpc_id       = vpc_id
      network_type = "vpc"
      name         = "${var.name_prefix}-spoke-${var.spoke_environments[idx]}-connection"
    }]
  )
}
