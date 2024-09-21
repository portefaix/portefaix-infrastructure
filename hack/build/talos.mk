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
include $(MKFILE_DIR)/talos.*.mk

TALOS_CONFIG=hack/talos
TALOS_OUTPUT=.secrets/talos

TALOS_VERSION=v1.7.6

CLOUDFLARE_BUCKET = $(CLOUDFLARE_BUCKET_$(ENV))
CLOUDFLARE_ACCOUNT = $(CLOUDFLARE_ACCOUNT_$(ENV))

AKEYLESS_PROFILE = $(AKEYLESS_PROFILE_$(ENV))

TALOS_CLUSTER = $(TALOS_CLUSTER_$(ENV))
TALOS_ENDPOINT = $(TALOS_ENDPOINT_$(ENV))

# ====================================
# C L O U D F L A R E
# ====================================

.PHONY: cloudflare-bucket-create
cloudflare-bucket-create: guard-ENV ## Create R2 bucket for Terraform states
	@echo -e "$(OK_COLOR)[$(APP)] Create bucket for Terraform states$(NO_COLOR)"
	@aws s3api create-bucket --bucket $(CLOUDFLARE_BUCKET) \
		--endpoint-url https://$(CLOUDFLARE_ACCOUNT).r2.cloudflarestorage.com \
    	--region auto

.PHONY: cloudflare-bucket-clean
cloudflare-bucket-clean: guard-ENV guard-BUCKET ## Delete all objects into a R2 bucket
	@echo -e "$(OK_COLOR)[$(APP)] Clean bucket $(BUCKET) $(NO_COLOR)"
	echo aws s3 rm s3://$(BUCKET) --recursive --endpoint-url https://$(CLOUDFLARE_ACCOUNT).r2.cloudflarestorage.com


# ====================================
# T A L O S
# ====================================

##@ Talos

.PHONY: talos-image
talos-image: guard-ENV ## Generate ID for Talos image
	@pushd $(TALOS_CONFIG)/$(ENV) \
		&& talhelper genurl iso
		&& popd

.PHONY: talos-secrets
talos-secrets:
	pushd $(TALOS_CONFIG)/$(ENV) \
		&& talhelper gensecret > talsecret.sops.yaml
		&& popd

.PHONY: talos-config
talos-config: guard-ENV ## Generate the Talos configuration
	pushd $(TALOS_CONFIG)/$(ENV) \
		&& talhelper genconfig \
		&& popd

.PHONY: talos-apply
talos-apply: guard-ENV guard-NODE_NAME guard-NODE_IP ## Generate the Talos configuration
	pushd $(TALOS_CONFIG)/$(ENV) \
		&& talosctl apply-config --insecure --nodes $(NODE_IP) --file clusterconfig/$(TALOS_CLUSTER)-$(NODE_NAME).yaml \
		&& popd

.PHONY: talos-bootstrap
talos-bootstrap: guard-ENV guard-NODE_IP ## Bootstrap the Talos cluster
	pushd $(TALOS_CONFIG)/$(ENV) \
		&& talosctl bootstrap -n $(NODE_IP) \
		&& popd

.PHONY: talos-kubeconfig
talos-kubeconfig: guard-ENV guard-NODE_IP ## Bootstrap the Talos cluster
	pushd $(TALOS_CONFIG)/$(ENV) \
		&& talosctl kubeconfig -n $(NODE_IP) ./kubeconfig \
		&& popd

# .PHONY: talos-image
# talos-image: guard-ENV ## Generate ID for Talos image
# 	@curl -X POST --data-binary @$(SCHEMATIC) https://factory.talos.dev/schematics

# .PHONY: talos-iso
# talos-iso: guard-SCHEMATIC_ID guard-ARCH ## Download Talos iso
# 	@curl -O --progress-bar https://factory.talos.dev/image/$(SCHEMATIC_ID)/$(TALOS_VERSION)/metal-$(ARCH).iso

# .PHONY: talos-init
# talos-init: guard-ENV ## Generate Talos secrets
# 	talosctl gen secrets -o $(TALOS_OUTPUT)/secrets.yaml              \
# 	&& talosctl gen config --force                                    \
# 		-o $(TALOS_OUTPUT)                                            \
#         --with-secrets $(TALOS_OUTPUT)/secrets.yaml                   \
#         $(TALOS_CLUSTER) $(TALOS_ENDPOINT) --install-disk '/dev/sdb'

# .PHONY: talos-config-endpoint
# talos-config-endpoint: guard-ENV guard-ENDPOINT_IP ## Configure Talosctl endpoint
# 	talosctl --talosconfig=$(TALOS_OUTPUT)/talosconfig config endpoint $(ENDPOINT_IP) \
# 		&& talosctl config merge $(TALOS_OUTPUT)/talosconfig

# .PHONY: talos-config-node
# talos-config-node: guard-ENV guard-NODE_IP ## Configure Talosctl node
# 	talosctl --talosconfig=$(TALOS_OUTPUT)/talosconfig config node $(NODE_IP) \
# 		&& talosctl config merge $(TALOS_OUTPUT)/talosconfig

# .PHONY: talos-apply-controlplane
# talos-apply-controlplane: guard-ENV guard-NODE_IP ## Setup the controlplane
# 	talosctl gen config --force \
#         --output $(TALOS_OUTPUT)/controlplane.yaml                \
#         --with-secrets $(TALOS_OUTPUT)/secrets.yaml               \
#         --with-cluster-discovery=false                            \
#         --output-types controlplane                               \
#         --config-patch @$(TALOS_CONFIG)/patches/controlplane.yaml \
#         --config-patch @$(TALOS_CONFIG)/nodes/controlplane.yaml   \
#         $(TALOS_CLUSTER) $(TALOS_ENDPOINT)                        \
# 	&& talosctl apply-config                                      \
# 		--file $(TALOS_OUTPUT)/controlplane.yaml                  \
# 		-e $(TALOS_ENDPOINT) -n $(NODE_IP)

# .PHONY: talos-bootstrap
# talos-bootstrap: guard-ENV guard-NODE_IP
# 	talosctl bootstrap --talosconfig $(TALOS_OUTPUT)/talosconfig -e $(NODE_IP) -n $(NODE_IP)

.PHONY: talos-kube-credentials
talos-kube-credentials: guard-ENV ## Credentials for Talos (ENV=xxx)
	@kubectl config use-context $(KUBE_CONTEXT)


# ====================================
# A K E Y L E S S
# ====================================

##@ AKeyless

.PHONY: akeyless-get-secret
akeyless-get-secret: guard-NAME guard-ENV ## Get a new secret
	@echo -e "$(OK_COLOR)[$(APP)] Akeyless secret: $(NAME)$(NO_COLOR)"
	akeyless get-secret-value --name=$(NAME) \
		--profile=$(AKEYLESS_PROFILE)


.PHONY: akeyless-add-secret
akeyless-add-secret: guard-NAME guard-VALUE guard-ENV ## Add a new secret
	@echo -e "$(OK_COLOR)[$(APP)] Akeyless new secret: $(NAME)$(NO_COLOR)"
	akeyless create-secret --name=$(NAME) --value=$(VALUE) \
		--profile=$(AKEYLESS_PROFILE) \
		--tag=homelab --tag=k3s

.PHONY: akeyless-update-secret
akeyless-update-secret: guard-NAME guard-VALUE guard-ENV ## Add a new secret
	@echo -e "$(OK_COLOR)[$(APP)] Akeyless new secret: $(NAME)$(NO_COLOR)"
	akeyless update-secret-val --name=$(NAME) --value=$(VALUE) \
		--profile=$(AKEYLESS_PROFILE)
