variable "name" {
  type        = string
  description = "Name of the spoke VPC and its Private Network."
}

variable "project_id" {
  type        = string
  description = "The Scaleway Project the spoke VPC is associated with."
}

variable "subnet_cidr" {
  type        = string
  description = "The IPv4 subnet CIDR of the spoke Private Network."
}

variable "tags" {
  type        = list(string)
  description = "Tags applied to the spoke VPC and Private Network."
  default     = []
}

variable "enable_transitivity" {
  type        = bool
  description = "Enable packets from peered VPCs to transit through this spoke VPC."
  default     = false
}

#############################################################################
# Hub connectivity

variable "hub_vpc_id" {
  type        = string
  description = "ID of the hub VPC to connect this spoke to. Set to null to leave the spoke unconnected."
  default     = null
}

#############################################################################
# ACL / isolation

variable "create_acl" {
  type        = bool
  description = "Whether to create a Network ACL on the spoke VPC."
  default     = true
}

variable "acl_default_policy" {
  type        = string
  description = "Default policy applied to traffic that matches no ACL rule."
  default     = "accept"
}

variable "deny_cidrs" {
  type        = list(string)
  description = "CIDR ranges to explicitly deny, typically the subnets of sibling spokes, so spoke-to-spoke traffic is only possible through the hub."
  default     = []
}
