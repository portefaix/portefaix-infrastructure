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

include hack/build/commons.mk
-include hack/build/$(CLOUD).$(ENV).mk

TERRAFORM=tofu

# ====================================
# D E V E L O P M E N T
# ====================================

##@ Development

.PHONY: clean
clean: ## Cleanup
	@echo -e "$(OK_COLOR)[$(BANNER)] Cleanup$(NO_COLOR)"
	@find . -name "*.retry"|xargs rm -f
	@rm -fr vendor
	@rm -fr venv

.PHONY: check
check: check-terraform check-tfenv check-inspec check-ansible  ## Check requirements

.PHONY: init
init: ## Initialize environment
	@poetry install --no-root
	@poetry run pre-commit install

.PHONY: validate
validate: ## Execute git-hooks
	@poetry run pre-commit run -a

.PHONY: license
license: guard-ACTION ## Check license (ACTION=xxx : fix or check)
	@docker run -it --rm -v $(shell pwd):/github/workspace ghcr.io/apache/skywalking-eyes/license-eye --config /github/workspace/.licenserc.yaml header $(ACTION)


foo: guard-CLOUD guard-ENV guard-SERVICE
	echo $(ANSIBLE_VENV)



# ====================================
# T E R R A F O R M
# ====================================

##@ Terraform

.PHONY: terraform-init
terraform-init: guard-SERVICE guard-ENV ## Plan infrastructure (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Init infrastructure$(NO_COLOR)" >&2
	@cd $(SERVICE) \
		&& $(TERRAFORM) init -upgrade -reconfigure -backend-config=backend-vars/$(ENV).tfvars

.PHONY: terraform-plan
terraform-plan: guard-SERVICE guard-ENV ## Plan infrastructure (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Plan infrastructure$(NO_COLOR)" >&2
	@cd $(SERVICE) \
		&& $(TERRAFORM) init -upgrade -reconfigure -backend-config=backend-vars/$(ENV).tfvars \
		&& $(TERRAFORM) plan -var-file=tfvars/$(ENV).tfvars

.PHONY: terraform-apply
terraform-apply: guard-SERVICE guard-ENV ## Builds or changes infrastructure (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Apply infrastructure$(NO_COLOR)" >&2
	@cd $(SERVICE) \
		&& $(TERRAFORM) init -upgrade -reconfigure -backend-config=backend-vars/$(ENV).tfvars \
		&& $(TERRAFORM) apply -var-file=tfvars/$(ENV).tfvars

.PHONY: terraform-destroy
terraform-destroy: guard-SERVICE guard-ENV ## Builds or changes infrastructure (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Apply infrastructure$(NO_COLOR)" >&2
	@cd $(SERVICE) \
		&& $(TERRAFORM) init -upgrade -reconfigure -backend-config=backend-vars/$(ENV).tfvars \
		&& $(TERRAFORM) destroy -lock-timeout=60s -var-file=tfvars/$(ENV).tfvars

.PHONY: terraform-tflint
terraform-tflint: guard-SERVICE ## Lint Terraform files
	@echo -e "$(OK_COLOR)[$(APP)] Lint Terraform code$(NO_COLOR)" >&2
	@cd $(SERVICE) \
		&& tflint \
		--enable-rule=terraform_deprecated_interpolation \
		--enable-rule=terraform_deprecated_index \
		--enable-rule=terraform_unused_declarations \
		--enable-rule=terraform_comment_syntax \
		--enable-rule=terraform_documented_outputs \
		--enable-rule=terraform_documented_variables \
		--enable-rule=terraform_typed_variables \
		--enable-rule=terraform_naming_convention \
		--enable-rule=terraform_required_version \
		--enable-rule=terraform_required_providers \
		--enable-rule=terraform_unused_required_providers \
		--enable-rule=terraform_standard_module_structure

.PHONY: terraform-tfsec
terraform-tfsec: guard-SERVICE ## Scan Terraform files
	@echo -e "$(OK_COLOR)[$(APP)] Lint Terraform code$(NO_COLOR)" >&2
	@cd $(SERVICE) \
		&& tfsec \

.PHONY: tfcloud-validate
tfcloud-validate: guard-SERVICE guard-ENV ## Plan infrastructure (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Init infrastructure$(NO_COLOR)" >&2
	@cd $(SERVICE)/$(ENV) \
		&& rm -fr .terraform \
		&& $(TERRAFORM) init \
		&& $(TERRAFORM) validate

.PHONY: tfcloud-init
tfcloud-init: guard-SERVICE guard-ENV ## Plan infrastructure using Terraform Cloud (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Init infrastructure$(NO_COLOR)" >&2
	@cd $(SERVICE)/$(ENV) \
		&& $(TERRAFORM) init

.PHONY: tfcloud-plan
tfcloud-plan: guard-SERVICE guard-ENV ## Plan infrastructure using Terraform Cloud (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Plan infrastructure$(NO_COLOR)" >&2
	@cd $(SERVICE)/$(ENV) \
		&& $(TERRAFORM) init \
		&& $(TERRAFORM) plan

.PHONY: tfcloud-apply
tfcloud-apply: guard-SERVICE guard-ENV ## Apply infrastructure using Terraform Cloud (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Plan infrastructure$(NO_COLOR)" >&2
	@cd $(SERVICE)/$(ENV) \
		&& $(TERRAFORM) init \
		&& $(TERRAFORM) apply

.PHONY: tfcloud-destroy
tfcloud-destroy: guard-SERVICE guard-ENV ## Apply infrastructure using Terraform Cloud (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Plan infrastructure$(NO_COLOR)" >&2
	@cd $(SERVICE)/$(ENV) \
		&& $(TERRAFORM) init \
		&& $(TERRAFORM) destroy


# ====================================
# T E R R A M A T E
# ====================================

##@ Terramate




# ====================================
# I N S P E C
# ====================================

##@ Inspec

.PHONY: inspec-init
inspec-init: ## Install requirements
	@echo -e "$(OK_COLOR)Install requirements$(NO_COLOR)" >&2
	@gem install bundler

.PHONY: inspec-deps
inspec-deps: ## Install dependencies
	@echo -e "$(OK_COLOR)Install requirements$(NO_COLOR)" >&2
	@bundle config set path vendor/bundle --local \
		&& bundle install

# ====================================
# A N S I B L E
# ====================================

##@ Ansible

.PHONY: ansible-init
ansible-init: ## Install requirements
	@echo -e "$(OK_COLOR)[$(APP)] Install requirements$(NO_COLOR)"
	@poetry install --no-root

# @test -d $(ANSIBLE_VENV) || $(PYTHON) -m venv $(ANSIBLE_VENV)
# @. $(ANSIBLE_VENV)/bin/activate \
# 	&& pip3 install ansible==$(ANSIBLE_VERSION) molecule docker

.PHONY: ansible-deps
ansible-deps: guard-CLOUD guard-ENV guard-SERVICE ## Install dependencies (SERVICE=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Install dependencies$(NO_COLOR)"
	echo $(ANSIBLE_VENV)
	@. $(ANSIBLE_VENV)/bin/activate \
		&& ansible-galaxy collection install -r $(SERVICE)/roles/requirements.yml -p $(ANSIBLE_ROLES) --force \
		&& ansible-galaxy install -r $(SERVICE)/roles/requirements.yml -p $(ANSIBLE_ROLES) --force

.PHONY: ansible-ping
ansible-ping: guard-CLOUD guard-ENV guard-SERVICE guard-ENV ## Check Ansible installation (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Check Ansible$(NO_COLOR)"
	@. $(ANSIBLE_VENV)/bin/activate \
		&& ansible -c local -m ping all -i $(SERVICE)/inventories/$(ENV).ini

.PHONY: ansible-debug
ansible-debug: guard-CLOUD guard-ENV guard-SERVICE guard-ENV ## Retrieve informations from hosts (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Check Ansible$(NO_COLOR)"
	@. $(ANSIBLE_VENV)/bin/activate \
		&& ansible -m setup all -i $(SERVICE)/inventories/$(ENV).ini

.PHONY: ansible-run
ansible-run: guard-CLOUD guard-ENV guard-SERVICE guard-ENV ## Execute Ansible playbook (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Execute Ansible playbook$(NO_COLOR)"
	@. $(ANSIBLE_VENV)/bin/activate \
		&& ansible-playbook ${DEBUG} -i $(SERVICE)/inventories/$(ENV).ini $(SERVICE)/main.yml

.PHONY: ansible-run-playbook
ansible-run-playbook: guard-CLOUD guard-ENV guard-SERVICE guard-ENV guard-PLAYBOOK ## Execute Ansible playbook (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Execute Ansible playbook$(NO_COLOR)"
	@. $(ANSIBLE_VENV)/bin/activate \
		&& ansible-playbook ${DEBUG} -i $(SERVICE)/inventories/$(ENV).ini $(SERVICE)/$(PLAYBOOK)

.PHONY: ansible-dryrun
ansible-dryrun: guard-CLOUD guard-ENVguard-SERVICE guard-ENV ## Execute Ansible playbook (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Execute Ansible playbook$(NO_COLOR)"
	@. $(ANSIBLE_VENV)/bin/activate \
		&& ansible-playbook ${DEBUG} -i $(SERVICE)/inventories/$(ENV).ini $(SERVICE)/main.yml --check


# ====================================
# P A C K E R
# ====================================

##@ Packer

.PHONY: packer-build
packer-build: guard-CLOUD guard-ENV guard-SERVICE guard-ENV ## Execute Ansible playbook (SERVICE=xxx ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Build Packer image$(NO_COLOR)"
	cd packer/$(CLOUD)/$(SERVICE) \
		&& packer init -upgrade . \
		&& packer build .
