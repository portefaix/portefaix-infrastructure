# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

#############################################################################
# Provider

variable "tenancy_ocid" {
  description = "tenancy id where to create the sources"
  type        = string
}

variable "user_ocid" {
  description = "id of user that terraform will use to create the resources"
  type        = string
}

variable "fingerprint" {
  description = "fingerprint of oci api private key"
  type        = string
}

variable "private_key" {
  description = "OCI api private key used"
  type        = string
}

variable "region" {
  description = "the oci region where resources will be created"
  type        = string
}

#############################################################################
# VCN

variable "vcn_id" {
  description = "The OCID of the VCN"
  type        = string
}

#############################################################################
# Bastion


variable "bastion_public_ip" {
  description = "The public IP of the bastion host"
  type        = string
}

#############################################################################
# OKE

variable "organization" {
  type        = string
  description = "Name of the Terraform Cloud organization"
}

variable "environment" {
  type        = string
  description = "Name of the Core environment"
}

variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use"
  type        = string
  default     = "v1.26.2"
}

variable "control_plane_allowed_cidrs" {
  description = "List of CIDRs allowed to access the Kubernetes API"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "node_subnet_id" {
  description = "The OCID of the subnet for node pools"
  type        = string
}

variable "lb_subnet_id" {
  description = "The OCID of the subnet for load balancers"
  type        = string
}

variable "pods_cidr" {
  description = "The CIDR block for Kubernetes pods"
  type        = string
  default     = "10.244.0.0/16"
}

variable "services_cidr" {
  description = "The CIDR block for Kubernetes services"
  type        = string
  default     = "10.96.0.0/16"
}

variable "node_pools" {
  description = "Node pool configuration"
  type = map(object({
    shape            = string
    ocpus            = number
    memory           = number
    os               = string
    os_version       = string
    count            = number
    node_pool_size   = number
    boot_volume_size = number
    node_labels      = map(string)
    node_taints      = list(string)
  }))
  default = {
    "main" = {
      shape            = "VM.Standard.E4.Flex"
      ocpus            = 2
      memory           = 16
      os               = "Oracle Linux"
      os_version       = "7.9"
      count            = 1
      node_pool_size   = 3
      boot_volume_size = 150
      node_labels      = {}
      node_taints      = []
    }
  }
}

variable "freeform_tags" {
  default = {
    bastion  = {}
    operator = {}
    vcn      = {}
    network  = {}
    cluster  = {}
    workers  = {}
    policy   = {}
  }
  description = "Freeform tags to be applied to created resources."
  type        = any
}
