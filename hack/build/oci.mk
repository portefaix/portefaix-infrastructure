
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

MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR := $(dir $(MKFILE_PATH))

include $(MKFILE_DIR)/commons.mk
include $(MKFILE_DIR)/oci.*.mk

OCI_PROFILE = portefaix
OCI_COMPARTMENT_NAME = portefaix
OCI_REGION = uk-london-1
# OCI_PROFILE = $(OCI_PROFILE_$(ENV))
# OCI_COMPARTMENT_NAME = $(OCI_COMPARTMENT_NAME_$(ENV))
# OCI_REGION = $(OCI_REGION_$(ENV))

# ====================================
# O C I
# ====================================

##@ OCI

.PHONY: oci-authenticate
oci-authenticate: guard-ENV ## Authentication
	oci session authenticate --profile-name $(OCI_PROFILE)

# --auth security_token \

.PHONY: oci-compartment
oci-compartment: guard-OCI_COMPARTMENT_PARENT_ID ## Create compartment
	@echo -e "$(OK_COLOR)[$(APP)] Create compartment$(NO_COLOR)"
	@oci iam compartment create \
		--profile $(OCI_PROFILE) \
		--compartment-id "$${OCI_COMPARTMENT_PARENT_ID}" \
		--name "$(OCI_COMPARTMENT_NAME)-root" \
		--description "Created by OCI CLI" \
		--freeform-tags '{"Project": "Portefaix", "Env": "Root", "Made-By": "OCI CLI"}'

.PHONY: oci-bucket
oci-bucket: guard-ROOT_COMPARTMENT_ID ## Create bucket for bootstrap
	@echo -e "$(OK_COLOR)[$(APP)] Create bucket for bootstrap$(NO_COLOR)"
	@oci os bucket create \
		--profile $(OCI_PROFILE) \
		--compartment-id "$(ROOT_COMPARTMENT_ID)" \
		--name "$(OCI_COMPARTMENT_NAME)-tfstates" \
		--region $(OCI_REGION) \
		--public-access-type NoPublicAccess \
		--storage-tier Standard \
		--freeform-tags '{"Project": "Portefaix", "Env": "Root", "Made-By": "OCI CLI"}'
