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

# data "talos_image_factory_extensions_versions" "this" {
#   talos_version = var.talos_version
#   filters = {
#     names = var.extensions
#     # names = [
#     #   "tailscale"
#     # ]
#   }
# }

# resource "talos_image_factory_schematic" "this" {
#   schematic = yamlencode({
#     customization = {
#       systemExtensions = {
#         officialExtensions = data.talos_image_factory_extensions_versions.this.extensions_info[*].name
#       }
#     }
#   })
# }

# data "talos_image_factory_urls" "this" {
#   talos_version = var.talos_version
#   schematic_id  = talos_image_factory_schematic.this.id
#   platform      = "nocloud"
# }


# locals {
#   version = var.image.version
#   schematic = var.image.schematic
#   schematic_id = jsondecode(data.http.schematic_id.response_body)["id"]
#   #schematic_id = talos_image_factory_schematic.this.id
#   image_id = "${local.schematic_id}_${local.version}"

#   update_version = coalesce(var.image.update_version, var.image.version)
#   update_schematic = coalesce(var.image.update_schematic, var.image.schematic)
#   update_schematic_id = jsondecode(data.http.updated_schematic_id.response_body)["id"]
#   #update_schematic_id = talos_image_factory_schematic.this.id
#   update_image_id = "${local.update_schematic_id}_${local.update_version}"
# }

# data "http" "schematic_id" {
#   url          = "${var.image.factory_url}/schematics"
#   method       = "POST"
#   request_body = local.schematic
# }

# data "http" "updated_schematic_id" {
#   url          = "${var.image.factory_url}/schematics"
#   method       = "POST"
#   request_body = local.update_schematic
# }

# /* Testing out new provider schematic feature */

# data "talos_image_factory_extensions_versions" "this" {
#   talos_version = var.image.version
#   filters = {
#     names = var.image.extensions
#     # names = [
#     #   "tailscale",
#     # ]
#   }
# # }

# resource "talos_image_factory_schematic" "generated" {
#   schematic = yamlencode(
#     {
#       customization = {
#         systemExtensions = {
#           officialExtensions = data.talos_image_factory_extensions_versions.this.extensions_info.*.name
#         }
#       }
#     }
#   )
# }

# output "schematic_id" {
#   value = talos_image_factory_schematic.generated.id
# }

# resource "talos_image_factory_schematic" "this" {
#   schematic = local.schematic
# }

# resource "talos_image_factory_schematic" "updated" {
#   schematic = local.update_schematic
# }
