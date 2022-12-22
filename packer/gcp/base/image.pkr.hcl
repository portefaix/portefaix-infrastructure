
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

source "googlecompute" "base" {
  project_id        = var.project_id
  instance_name     = "portefaix-base-${local.timestamp}"
  image_name        = "portefaix-base-${local.timestamp}"
  image_description = "Portefaix Base Image"
  source_image      = "ubuntu-2204-jammy-v20221101a"
  ssh_username      = "portefaix"
  machine_type      = "n2-standard-8"
  region            = var.region
  zone              = var.zone
  disk_size         = var.disk_size
  disk_type         = "pd-ssd"
  image_family      = ""
  preemptible       = true
  scopes            = var.scopes
  tags              = var.tags
  image_labels      = var.labels
}

build {
  name = "base"

  sources = ["source.googlecompute.base"]

  provisioner "ansible-local" {
    clean_staging_directory = true
    galaxy_command          = "ansible-galaxy"
    galaxy_file             = "ansible/requirements.yml"
    // playbook_dir            = "ansible/data"
    playbook_file = "ansible/ansible.yml"
  }
}
