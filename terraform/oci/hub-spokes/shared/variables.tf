#############################################################################
# Provider

variable "oci_private_key" {
  description = "OCI api private key used"
  type        = string
}

#############################################################################
# Hub

variable "tenancy_ocid" {
  description = "tenancy id where to create the sources"
  type        = string
}

variable "hub_compartment_id" {
  type        = string
  description = "Hub Compartment ID"
}

#############################################################################
# Network Configuration

variable "network_configuration_categories" {
  description = "Map of VCNs to create"
  type        = any
}

# #############################################################################
# Common

variable "freeform_tags" {
  description = "simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
  type        = map(any)
  default = {
    Managed-By = "Terraform"
  }
}
