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

# variable "oci_tenancy_ocid" {
#   type        = string
#   description = "tenancy id where to create the sources"
# }

# variable "oci_user_ocid" {
#   type        = string
#   description = "id of user that terraform will use to create the resources"
# }

# variable "oci_fingerprint" {
#   type        = string
#   description = "fingerprint of oci api private key"
# }

# variable "oci_private_key" {
#   type        = string
#   description = "OCI api private key used"
# }

# variable "oci_region" {
#   type        = string
#   description = "the oci region where resources will be created"
# }

variable "aws_access_key_id" {
  type        = string
  description = "AWS access key"
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS secret key"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}
