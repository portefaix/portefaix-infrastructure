resource "oci_core_drg" "hub_drg" {
  compartment_id = var.compartment_network_id
  display_name   = "hub-drg"
  freeform_tags  = var.freeform_tags
}

resource "oci_core_drg_attachment" "hub_vcn_drg_attachment" {
  drg_id       = oci_core_drg.hub_drg.id
  vcn_id       = module.hub_vcn.vcn_id
  display_name = "hub-vcn-drg-attachment"
}

resource "oci_core_route_table" "hub_drg_route_table" {
  compartment_id = var.compartment_network_id
  vcn_id         = module.hub_vcn.vcn_id
  display_name   = "hub-drg-route-table"

  # Route to internet via Internet Gateway
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = module.hub_vcn.internet_gateway_id
  }

  freeform_tags = var.freeform_tags
}
