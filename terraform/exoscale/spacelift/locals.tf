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
  cloud_provider = "exoscale"
  labels         = [local.cloud_provider]

  stack_dependencies = flatten([
    for stack_key, stack in var.stacks : [
      for dependency in stack.dependencies : {
        stack_name      = stack_key
        dependency_name = dependency
      }
    ]
  ])
}
