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

# tfsec:ignore:google-iam-no-project-level-service-account-impersonation
module "pubsub" {
  source  = "terraform-google-modules/pubsub/google"
  version = "8.2.0"

  project_id   = var.project
  topic        = var.topic
  topic_labels = var.topic_labels

  push_subscriptions = [
    {
      name                 = "gke"
      push_endpoint        = format("https://%s-gke.appspot.com/", var.project)
      x-goog-version       = "v1beta1"
      ack_deadline_seconds = 20
      expiration_policy    = "1209600s" # two weeks
    },
  ]

  subscription_labels = var.subscription_labels
}
