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
include $(MKFILE_DIR)/k3s.*.mk

MNT_DEVICE = $(MNT_DEVICE_$(ENV))
MNT_DEVICE_BOOT = $(MNT_DEVICE_BOOT_$(ENV))
MNT_DEVICE_ROOT = $(MNT_DEVICE_ROOT_$(ENV))

MNT_ROOT   = $(MNT_ROOT_$(ENV))
MNT_BOOT   = $(MNT_BOOT_$(ENV))

K3S_SSH_KEY = $(K3S_SSH_KEY_$(ENV))
K3S_VERSION = $(K3S_VERSION_$(ENV))
K3S_USER    = $(K3S_USER_$(ENV))

K3S_ARGS := --disable metrics-server --disable traefik
K3S_ARGS += --kube-controller-manager-arg 'bind-address=0.0.0.0'
K3S_ARGS += --kube-proxy-arg 'metrics-bind-address=0.0.0.0'
K3S_ARGS += --kube-scheduler-arg 'bind-address=0.0.0.0'
K3S_ARGS += --etcd-expose-metrics=true
K3S_ARGS += --resolv-conf=/run/systemd/resolve/resolv.conf
K3S_ARGS += --flannel-backend=none --disable-network-policy
# K3S_ARGS += --kube-apiserver-arg 'audit-log-path=/var/lib/rancher/k3s/server/logs/audit.log' 
# K3S_ARGS += --kube-apiserver-arg 'audit-policy-file=/var/lib/rancher/k3s/server/audit/audit.yaml'
# K3S_ARGS += --kube-apiserver-arg 'audit-webhook-config-file=/var/lib/rancher/k3s/server/audit/webhook.yaml'
# K3S_ARGS += --kube-apiserver-arg 'audit-log-maxage=30'
# K3S_ARGS += --kube-apiserver-arg 'audit-log-maxbackup=10'
# K3S_ARGS += --kube-apiserver-arg 'audit-log-maxsize=100'
# K3S_ARGS += --kube-apiserver-arg 'admission-control-config-file=/var/lib/rancher/k3s/server/psa.yaml'

AKEYLESS_PROFILE = $(AKEYLESS_PROFILE_$(ENV))

CLOUDFLARE_BUCKET = $(CLOUDFLARE_BUCKET_$(ENV))
CLOUDFLARE_ACCOUNT = $(CLOUDFLARE_ACCOUNT_$(ENV))

# ====================================
# S D C A R D
# ====================================

##@ SDCard

.PHONY: sdcard-format
sdcard-format: guard-ENV guard-IMG sdcard-unmount ## Format the SD card with Raspbian
	@echo -e "$(OK_COLOR)[$(APP)] Formatting SD card with $(IMG) ${SERVICE}$(NO_COLOR)"
	sudo dd bs=4M if=./$(IMG) of=$(MNT_DEVICE) status=progress conv=fsync

.PHONY: sdcard-mount
sdcard-mount: guard-ENV ## Mount the current SD device
	sudo mkdir -p $(MNT_BOOT)
	sudo mkdir -p $(MNT_ROOT)
	sudo mount $(MNT_DEVICE_BOOT) $(MNT_BOOT)
	sudo mount $(MNT_DEVICE_ROOT) $(MNT_ROOT)

.PHONY: sdcard-unmount
sdcard-unmount: guard-ENV ## Unmount the current SD device
	sudo umount $(MNT_DEVICE_BOOT) || true
	sudo umount $(MNT_DEVICE_ROOT) || true


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
	aws s3 rm s3://$(BUCKET) --recursive --endpoint-url https://$(CLOUDFLARE_ACCOUNT).r2.cloudflarestorage.com


# ====================================
# K 3 S
# ====================================

##@ K3s

.PHONY: k3s-create
k3s-create: guard-SERVER_IP guard-EXTERNAL_IP guard-USER guard-ENV ## Setup a k3s cluster
	@echo -e "$(OK_COLOR)[$(APP)] Install K3S$(NO_COLOR)"
	@k3sup install --ip $(SERVER_IP) --user $(K3S_USER) \
		--cluster \
		--k3s-version $(K3S_VERSION) --merge \
		--k3s-extra-args "$(K3S_ARGS) --node-ip=$(SERVER_IP) --node-external-ip=$(EXTERNAL_IP)" \
		--ssh-key $(K3S_SSH_KEY) \
  		--local-path $${HOME}/.kube/config \
  		--context k3s-portefaix-$(ENV)

.PHONY: k3s-join
k3s-join: guard-SERVER_IP guard-AGENT_IP guard-EXTERNAL_IP guard-USER guard-ENV ## Add a node to the k3s cluster
	@echo -e "$(OK_COLOR)[$(APP)] Add a K3S node$(NO_COLOR)"
	@k3sup join --ip $(AGENT_IP) --server-ip $(SERVER_IP) --user $(K3S_USER) \
		--k3s-extra-args "--node-ip=$(AGENT_IP) --node-external-ip=$(EXTERNAL_IP)" \
		--ssh-key $(K3S_SSH_KEY) --k3s-version $(K3S_VERSION)

.PHONY: k3s-config
k3s-config: guard-SERVER_IP guard-USER guard-ENV ## Merge Kubernetes configuration
	@echo -e "$(OK_COLOR)[$(APP)] Kubernetes configuration$(NO_COLOR)"
	@k3sup install --ip $(SERVER_IP) --user $(K3S_USER) \
		--merge --skip-install \
		--local-path $${HOME}/.kube/config \
		--context $(KUBE_CONTEXT)

.PHONY: k3s-kube-credentials
k3s-kube-credentials: guard-ENV ## Credentials for k3s (ENV=xxx)
	@kubectl config use-context $(KUBE_CONTEXT)

# ====================================
# A K E Y L E S S
# ====================================

##@ AKeyless

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
