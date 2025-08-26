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

resource "cloudflare_r2_bucket" "observability" {
  for_each = var.buckets

  account_id    = var.cloudflare_account_id
  name          = each.key
  location      = each.value.location
  storage_class = each.value.storage_class
}

resource "cloudflare_r2_bucket_lifecycle" "observability" {
  for_each = var.buckets

  account_id  = var.cloudflare_account_id
  bucket_name = cloudflare_r2_bucket.observability[each.key].name

  rules = [
    {
      id      = format("Delete all objects and uploads after %s days", each.value.days)
      enabled = true
      conditions = {
        prefix = "/"
      }
      delete_objects_transition = {
        condition = {
          max_age = each.value.days
          type    = "Age"
        }
      }
      abort_multipart_uploads_transition = {
        condition = {
          max_age = each.value.days
          type    = "Age"
        }
      }
    }
  ]
}
