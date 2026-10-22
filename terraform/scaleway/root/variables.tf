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
# Organization

variable "project_prefix" {
  type        = string
  description = "Prefix used to name the Scaleway Projects created for each environment."
  default     = "portefaix"
}

variable "environments" {
  type        = list(string)
  description = "List of environments to provision as Scaleway Projects."
}

variable "network_project_name" {
  type        = string
  description = "Name suffix of the network Project that hosts the hub VPC (see terraform/scaleway/vpc)."
  default     = "network"
}

#############################################################################
# IAM

variable "admin_group_name" {
  type        = string
  description = "Name of the IAM group for Portefaix administrators."
  default     = "PortefaixAdministrators"
}

variable "spacelift_application_name" {
  type        = string
  description = "Name of the IAM application used by Spacelift to manage the environment Projects."
  default     = "spacelift"
}

variable "spacelift_permission_set_names" {
  type        = list(string)
  description = "Permission sets granted to the Spacelift IAM application on every environment Project."
  default     = ["AllProductsFullAccess"]
}

#############################################################################
# Billing

variable "budget_consumption_limit" {
  type        = number
  description = "Cost limit for the organization budget, in euros."
}

variable "budget_alert_thresholds" {
  type        = list(number)
  description = "Percentages of the budget consumption limit that trigger an alert."
  default     = [50, 80, 100]
}

variable "budget_alert_emails" {
  type        = list(string)
  description = "Email addresses notified when a budget alert threshold is reached."
}
