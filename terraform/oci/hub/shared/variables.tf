#############################################################################
# Provider

# variable "tenancy_ocid" {
#   description = "tenancy id where to create the sources"
#   type        = string
# }

# variable "user_ocid" {
#   description = "id of user that terraform will use to create the resources"
#   type        = string
# }

# variable "fingerprint" {
#   description = "fingerprint of oci api private key"
#   type        = string
# }

variable "oci_private_key" {
  description = "OCI api private key used"
  type        = string
}

# variable "region" {
#   description = "the oci region where resources will be created"
#   type        = string
# }

#############################################################################
# Hub

variable "hub_compartment_id" {
  type        = string
  description = "Hub Compartment ID"
}

#############################################################################
# Network Configuration

variable "vcns" {
  description = "Map of VCNs to create"
  type        = any
}

variable "hub_subnets" {
  description = "Map of Hub subnets to create"
  type        = any
}

variable "dev_subnets" {
  description = "Map of Dev subnets to create"
  type        = any
}

variable "staging_subnets" {
  description = "Map of Staging subnets to create"
  type        = any
}

variable "prod_subnets" {
  description = "Map of Prod subnets to create"
  type        = any
}

variable "hub_security_lists" {
  description = "Map of Hub security lists to create"
  type        = any
}

variable "dev_security_lists" {
  description = "Map of Dev security lists to create"
  type        = any
}

variable "staging_security_lists" {
  description = "Map of Staging security lists to create"
  type        = any
}

variable "prod_security_lists" {
  description = "Map of Prod security lists to create"
  type        = any
}

variable "hub_route_tables" {
  description = "Map of Hub route tables to create"
  type        = any
}

variable "dev_route_tables" {
  description = "Map of Dev route tables to create"
  type        = any
}

variable "staging_route_tables" {
  description = "Map of Staging route tables to create"
  type        = any
}

variable "prod_route_tables" {
  description = "Map of Prod route tables to create"
  type        = any
}

variable "vcn_gateways" {
  description = "Map of VCN-specific gateways to create"
  type        = any
}

variable "drg_config" {
  description = "DRG configuration"
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
