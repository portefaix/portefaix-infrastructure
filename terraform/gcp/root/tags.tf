
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

resource "google_tags_tag_key" "organization" {
  parent      = data.google_organization.this.name
  short_name  = "organization"
  description = "Scoping tag for organization policy constraint management."
}

resource "google_tags_tag_value" "organization" {
  parent      = google_tags_tag_key.organization.id
  short_name  = var.organization_name
  description = "Org policy scope tag."
}

resource "google_tags_tag_key" "business_unit" {
  parent      = data.google_organization.this.name
  short_name  = "business_unit"
  description = "Scoping tag for organization policy constraint management."
}

resource "google_tags_tag_value" "engineering" {
  parent      = google_tags_tag_key.business_unit.id
  short_name  = "engineering"
  description = "Engineering tag."
}

resource "google_tags_tag_value" "deprecated" {
  parent      = google_tags_tag_key.business_unit.id
  short_name  = "deprecated"
  description = "Deprecated tag."
}

# resource "google_tags_tag_binding" "shared_folder" {
#   parent    = "//cloudresourcemanager.googleapis.com/${module.folders.folders_map["Shared"].id}" # id = folders/xxxx
#   tag_value = "tagValues/${google_tags_tag_value.engineering.name}"
# }
