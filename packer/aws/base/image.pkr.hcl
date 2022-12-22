
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

source "amazon-ebs" "base" {
  ami_name                    = "portefaix-base-${local.timestamp}"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  source_ami                  = "${data.amazon-ami.ami_services.id}"
  ssh_clear_authorized_keys   = true
  ssh_username                = "portefaix"
  // subnet_filter {
  //   filters = {
  //     "tag:Type" = "public"
  //   }
  //   random = true
  // }
}

build {
  name = "base"

  sources = ["source.amazon-ebs.base"]

  provisioner "ansible-local" {
    clean_staging_directory = true
    galaxy_command          = "ansible-galaxy"
    galaxy_file             = "ansible/requirements.yml"
    // playbook_dir            = "ansible/data"
    playbook_file           = "ansible/ansible.yml"
  }

}
