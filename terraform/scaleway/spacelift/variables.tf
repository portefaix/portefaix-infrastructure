#############################################################################
# Provider


#############################################################################
# Spacelift

variable "root_space_id" {
  type        = string
  description = "The Portefaix space"
}

variable "space" {
  type        = string
  description = "The space for this project"
}

variable "environments" {
  type        = list(string)
  description = "List of environments"
}

variable "repository" {
  type        = string
  description = "Github repository"
}

variable "stacks" {
  type = map(object({
    project_root = string
    branch       = string
    labels       = list(string)
    environment  = string
    dependencies = list(string)
  }))
  description = "Spacelift stacks"
}

variable "scw_access_key" {
  type        = string
  description = "Scaleway access key"
}

variable "scw_secret_key" {
  type        = string
  description = "Scaleway secret key"
}

variable "scw_default_project_id" {
  type        = string
  description = "Scaleway Default Project ID"
}

variable "scw_project_id" {
  type        = string
  description = "Scaleway Project ID"
}

variable "scw_default_organization_id" {
  type        = string
  description = "Scaleway Organization ID"
}

variable "aws_access_key_id" {
  type        = string
  description = "AWS access key"
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS secret key"
}

variable "aws_default_region" {
  type        = string
  description = "The AWS default region"
}
