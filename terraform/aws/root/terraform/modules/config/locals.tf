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

locals {
  service_name     = format("%sConfigRecorder", title(var.org_name))
  role_policy_name = format("%sAWSConfigPolicy", title(var.org_name))
  role_name        = format("%sAWSConfig", title(var.org_name))
  org_role_name    = format("%sAWSConfigOrganization", title(var.org_name))
  bucket_name      = format("%s-config", var.org_name)
  sns_topic_name   = format("%s-config", var.org_name)
}
