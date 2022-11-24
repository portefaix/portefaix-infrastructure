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

variable "name" {
  type        = string
  description = "Which operating system to use for this agent template build?"
  default = "amzn2-ami-hvm-2.0.*"
}

variable "architecture" {
  type        = string
  description = "CPU architecture ID of the build with the following possible values: [amd64 (default), arm64]"
  default     = "x86_64"
}

variable "aws_region" {
  type    = string
  default = "eu-west-1"
}
