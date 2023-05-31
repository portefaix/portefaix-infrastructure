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
# Subnets

variable "control_plane_cidr" {
  type        = string
  description = "Control plane subnet CIDR"
}

variable "workers_cidr" {
  type        = string
  description = "OKE Workers subnet CIDR"
}

variable "pub_lb_cidr" {
  type        = string
  description = "Public Load Balancer subnet CIDR"
}

variable "int_lb_cidr" {
  type        = string
  description = "Internal Load Balancer subnet CIDR"
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

# variable "subnets" {
#   description = "parameters to cidrsubnet function to calculate subnet masks within the VCN."
#   default = {
#     bastion  = { netnum = 0, newbits = 13 }
#     operator = { netnum = 1, newbits = 13 }
#     cp       = { netnum = 2, newbits = 13 }
#     int_lb   = { netnum = 16, newbits = 11 }
#     pub_lb   = { netnum = 17, newbits = 11 }
#     workers  = { netnum = 1, newbits = 2 }
#     pods     = { netnum = 2, newbits = 2 }
#     fss      = { netnum = 18, newbits = 11 }
#   }
#   type = map(any)
# }

variable "control_plane_allowed_cidrs" {
  description = "The list of CIDR blocks from which the control plane can be accessed."
  type        = list(string)
}

variable "enable_waf" {
  description = "Whether to enable WAF monitoring of load balancers."
  type        = bool
  default     = false
}

variable "pods_cidr" {
  default     = "10.244.0.0/16"
  description = "The CIDR range used for IP addresses by the pods. A /16 CIDR is generally sufficient. This CIDR should not overlap with any subnet range in the VCN (it can also be outside the VCN CIDR range). Ignored when cni_type = 'npn'."
  type        = string
}

variable "services_cidr" {
  default     = "10.96.0.0/16"
  description = "The CIDR range used within the cluster by Kubernetes services (ClusterIPs). This CIDR should not overlap with the VCN CIDR range."
  type        = string
}

variable "kubernetes_version" {
  default     = "v1.25.4"
  description = "The version of kubernetes to use when provisioning OKE or to upgrade an existing OKE cluster to."
  type        = string
}

variable "worker_pools" {
  default     = {}
  description = "Tuple of OKE worker pools where each key maps to the OCID of an OCI resource, and value contains its definition."
  type        = any
}

variable "worker_pool_mode" {
  default     = "node-pool"
  description = "Default management mode for workers when unspecified on a pool. Only 'node-pool' is currently supported."
  type        = string
}

variable "worker_pool_size" {
  default     = 0
  description = "Default size for worker pools when unspecified on a pool."
  type        = number
}

variable "worker_image_os" {
  default     = "Oracle Linux"
  description = "Default worker image operating system name when worker_image_type = 'oke' or 'platform' and unspecified on a pool."
  type        = string
}

variable "worker_image_os_version" {
  default     = "8"
  description = "Default worker image operating system version when worker_image_type = 'oke' or 'platform' and unspecified on a pool."
  type        = string
}

variable "worker_shape" {
  default = {
    shape            = "VM.Standard.E4.Flex",
    ocpus            = 1,
    memory           = 6,
    boot_volume_size = 50
  }
  description = "Default shape of the created worker instance when unspecified on a pool."
  type        = map(any)
}

variable "worker_node_labels" {
  default     = {}
  description = "Default worker node labels. Merged with labels defined on each pool."
  type        = map(string)
}

variable "worker_node_metadata" {
  default     = {}
  description = "Map of additional worker node instance metadata. Merged with metadata defined on each pool."
  type        = map(string)
}

variable "worker_preemptible_config" {
  default = {
    enable                  = false,
    is_preserve_boot_volume = false
  }
  description = "Default preemptible Compute configuration when unspecified on a pool. See <a href=https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengusingpreemptiblecapacity.htm>Preemptible Worker Nodes</a> for more information."
  type        = map(any)
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
