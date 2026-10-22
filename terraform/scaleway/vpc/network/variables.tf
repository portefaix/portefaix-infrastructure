#############################################################################
# Provider

variable "region" {
  type        = string
  description = "The region that will be used as default value for all resources."
}

variable "zone" {
  type        = string
  description = "The zone that will be used as default value for all resources."
}

#############################################################################
# Hub

variable "name" {
  type        = string
  description = "Name prefix for the hub VPC and its Private Networks."
}

variable "project_id" {
  type        = string
  description = "The Scaleway Project the hub belongs to. This is the network Project created by terraform/scaleway/root."
}

variable "subnet_cidrs" {
  type        = map(string)
  description = "IPv4 subnet CIDR for each hub Private Network (keys: transit, shared_services, management)."
}

variable "enable_public_gateway" {
  type        = bool
  description = "Attach a Public Gateway to the hub transit Private Network for internet egress."
  default     = true
}

variable "public_gateway_type" {
  type        = string
  description = "The hub Public Gateway commercial type."
  default     = "VPC-GW-S"
}

variable "tags" {
  type        = list(string)
  description = "Tags applied to every resource created by this stack."
  default     = ["terraform", "portefaix", "hub"]
}
