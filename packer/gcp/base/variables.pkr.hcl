
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

variable "project_id" {
  type    = string
  default = "portefaix-dev"
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "zone" {
  type    = string
  default = "europe-west1-c"
}

variable "machine_type" {
  description = "VM machine type on which to build new image"
  type        = string
  default     = "n2-standard-4"
}

variable "disk_size" {
  description = "Size of disk image in GB"
  type        = number
  default     = 50
}

variable "scopes" {
  description = <<EOD
Service account scopes to attach to the instance. See
https://cloud.google.com/compute/docs/access/service-accounts.
EOD
  type        = list(string)
  default = [
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/devstorage.full_control",
    "https://www.googleapis.com/auth/logging.write",
  ]
}

variable "tags" {
  type    = list(string)
  default = ["base"]
}

variable "labels" {
  type = map(string)
  default = {
    service           = "base"
    made-by           = "packer"
    portefaix-version = "v0-43-0"
  }
}
