#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

reset_color="\\e[0m"
color_red="\\e[31m"
color_green="\\e[32m"
color_blue="\\e[36m"
color_yellow="\\e[33m"

HOME_IP=$(curl -s http://ifconfig.me)

# Infisical configuration
INFISICAL_PROJECT_ID=${INFISICAL_PROJECT_ID:-""}
INFISICAL_ENVIRONMENT=${INFISICAL_ENVIRONMENT:-"prod"}
INFISICAL_CLI=""

# Define log levels
LOG_LEVEL_ERROR=0
LOG_LEVEL_WARN=1
LOG_LEVEL_INFO=2
LOG_LEVEL_DEBUG=3
LOG_LEVEL_TRACE=4

# Set default log level (can be overridden by env or arg)
LOG_LEVEL="${LOG_LEVEL:=$LOG_LEVEL_INFO}"

function log_trace { [ "${LOG_LEVEL_TRACE}" -le "${LOG_LEVEL}" ] && echo -e "${color_blue}🟡 $*${reset_color}"; }
function log_debug { [ "${LOG_LEVEL_DEBUG}" -le "${LOG_LEVEL}" ] && echo -e "${color_blue}🔵 $*${reset_color}"; }
function log_info { [ "${LOG_LEVEL_INFO}" -le "${LOG_LEVEL}" ] && echo -e "${color_green}🟢 $*${reset_color}"; }
function log_warn { [ "${LOG_LEVEL_WARN}" -le "${LOG_LEVEL}" ] && echo -e "${color_yellow}🟠 $*${reset_color}"; }
function log_error { [ "${LOG_LEVEL_ERROR}" -le "${LOG_LEVEL}" ] && echo -e "${color_red}🔴 $*${reset_color}"; }

function usage() {
  echo "Usage: $0 <cloud provider>"
}

function validate_infisical_setup() {
  log_info "[infisical] Validating Infisical setup..."

  if [ -z "${INFISICAL_PROJECT_ID}" ]; then
    log_error "INFISICAL_PROJECT_ID environment variable must be set"
    log_info "Example: export INFISICAL_PROJECT_ID='your-project-id'"
    return 1
  fi

  if ! command -v infisical >/dev/null 2>&1; then
    log_error "Infisical CLI not found. Please install it first."
    log_info "Visit: https://infisical.com/docs/cli/overview"
    return 1
  fi
  INFISICAL_CLI=$(which infisical)

  # Test authentication by trying to list secrets
  if ! infisical secrets --projectId="${INFISICAL_PROJECT_ID}" --env="${INFISICAL_ENVIRONMENT}" --path="/" --silent >/dev/null 2>&1; then
    log_error "Failed to authenticate with Infisical. Please login first."
    log_info "Run: infisical login"
    return 1
  fi
  # infisical -v

  log_debug "[infisical] Infisical setup validation completed successfully"
  return 0
}

function get_infisical_secret() {
  local secret_name="$1"
  local path="${2:-/}"
  local var_name="$3"

  local secret_value
  secret_value=$(${INFISICAL_CLI} secrets get "${secret_name}" --projectId="${INFISICAL_PROJECT_ID}" --env="${INFISICAL_ENVIRONMENT}" --path="${path}" --silent --plain)
  local exit_code=$?

  if [ ${exit_code} -ne 0 ] || [ -z "${secret_value}" ]; then
    log_error "[Infisical] Failed to retrieve secret: ${secret_name} from path: ${path} (exit code: ${exit_code})"
    return 1
  fi

  output=$(printf "%-40s | %-60s\n" "${secret_name}" "${secret_value}")
  log_debug "[infisical] ${output}"

  # echo "${secret_value}"
  export "$var_name=$secret_value"
}

function cleanup {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_ENDPOINT_URL_S3
  unset AWS_DEFAULT_REGION
  unset AWS_REGION
  unset AWS_SESSION_TOKEN
  unset AWS_S3_ENDPOINT
}

function setup_cloudflare() {
  log_info "[networking] Cloudflare"
  local path="/cloudflare"
  get_infisical_secret "CLOUDFLARE_ACCOUNT_ID" "${path}" "CLOUDFLARE_ACCOUNT_ID" || return 1
  get_infisical_secret "CLOUDFLARE_API_TOKEN" "${path}" "CLOUDFLARE_API_TOKEN" || return 1
  get_infisical_secret "AWS_ACCESS_KEY_ID" "${path}" "AWS_ACCESS_KEY_ID" || return 1
  get_infisical_secret "AWS_SECRET_ACCESS_KEY" "${path}" "AWS_SECRET_ACCESS_KEY" || return 1
  get_infisical_secret "AWS_ENDPOINT_URL_S3" "${path}" "AWS_ENDPOINT_URL_S3" || return 1
  get_infisical_secret "GITHUB_OAUTH_CLIENT_ID" "${path}" "TF_VAR_github_oauth_client_id" || return 1
  get_infisical_secret "GITHUB_OAUTH_CLIENT_SECRET" "${path}" "TF_VAR_github_oauth_client_secret" || return 1
  get_infisical_secret "CLOUDFLARE_EMAIL" "${path}" "TF_VAR_cloudflare_email" || return 1
  get_infisical_secret "CLOUDFLARE_TUNNEL_ID" "${path}" "TF_VAR_cloudflare_tunnel_id" || return 1
  get_infisical_secret "CLOUDFLARE_ZONE_ID" "${path}" "TF_VAR_cloudflare_zone_id" || return 1

  export TF_VAR_cloudflare_account_id="${CLOUDFLARE_ACCOUNT_ID}"
  export TF_VAR_cloudflare_api_token="${CLOUDFLARE_API_TOKEN}"
  export TF_VAR_access_key="${AWS_ACCESS_KEY_ID}"
  export TF_VAR_secret_access_key="${AWS_SECRET_ACCESS_KEY}"

}

# Github for Flux
function setup_flux() {
  log_info "[gitops] Flux"
  local path="/github"
  get_infisical_secret "GITHUB_USERNAME" "${path}" "GITHUB_USERNAME" || return 1
}

function setup_pagerduty() {
  log_info "[oncall] Pagerduty"
  local path="/pagerduty"
  get_infisical_secret "PAGERDUTY_TOKEN" "${path}" "PAGERDUTY_TOKEN" || return 1
}

# function setup_tailscale() {
#   log_info "[networking] Tailscale"
#   get_infisical_secret "TAILSCALE_AUTHKEY" "/tailscale" "TAILSCALE_AUTHKEY" || return 1
# }

function setup_terraform_cloud() {
  log_info "[tacos] Terraform Cloud"
  local path="/terraform-cloud"
  get_infisical_secret "TFE_TOKEN" "${path}" "TFE_TOKEN" || return 1
  get_infisical_secret "GITHUB_OAUTH_TOKEN" "${path}" "TF_VAR_github_oauth_token" || return 1
  get_infisical_secret "AWS_ROLE_ARN" "${path}" "TF_VAR_aws_role_arn" || return 1
}

function setup_spacelift {
  log_info "[tacos] Spacelift"
  local path="/spacelift"
  get_infisical_secret "SPACELIFT_API_KEY_ENDPOINT" "${path}" "SPACELIFT_API_KEY_ENDPOINT" || return 1
  get_infisical_secret "SPACELIFT_API_KEY_ID" "${path}" "SPACELIFT_API_KEY_ID" || return 1
  get_infisical_secret "SPACELIFT_API_KEY_SECRET" "${path}" "SPACELIFT_API_KEY_SECRET" || return 1
  get_infisical_secret "ROOT_SPACE_ID" "${path}" "TF_VAR_root_space_id" || return 1
}

function setup_env0 {
  log_info "[tacos] Env0"
  local path="/env0"
  get_infisical_secret "ENV0_API_KEY" "${path}" "ENV0_API_KEY" || return 1
  get_infisical_secret "ENV0_API_SECRET" "${path}" "ENV0_API_SECRET" || return 1
  get_infisical_secret "ENV0_ORGANIZATION_ID" "${path}" "ENV0_ORGANIZATION_ID" || return 1
}

function setup_scalr {
  log_info "[tacos] Scalr"
  local path="/scalr"
  get_infisical_secret "SCALR_HOSTNAME" "${path}" "SCALR_HOSTNAME" || return 1
  get_infisical_secret "SCALR_TOKEN" "${path}" "SCALR_TOKEN" || return 1
}

function setup_grafana_cloud() {
  log_info "[observability] Grafana Cloud"
  local path="/grafana-cloud"
  get_infisical_secret "PORTEFAIX_GRAFANA_CLOUD_API_KEY" "${path}" "PORTEFAIX_GRAFANA_CLOUD_API_KEY" || return 1
  get_infisical_secret "PORTEFAIX_GRAFANA_CLOUD_PROMETHEUS" "${path}" "GRAFANA_CLOUD_PROMETHEUS" || return 1
  get_infisical_secret "PORTEFAIX_GRAFANA_CLOUD_LOKI" "${path}" "PORTEFAIX_GRAFANA_CLOUD_LOKI" || return 1
  get_infisical_secret "PORTEFAIX_GRAFANA_CLOUD_TEMPO" "${path}" "PORTEFAIX_GRAFANA_CLOUD_TEMPO" || return 1
}

# GCP
function setup_gcp() {
  log_info "[cloudprovider] Google Cloud Platform"
  local path="/google-cloud"
  get_infisical_secret "GCP_ORG_ID" "${path}" "GCP_ORG_ID" || return 1
  get_infisical_secret "GCP_BILLING_ACCOUNT_ID" "${path}" "TF_VAR_billing_account" || return 1
  export TF_VAR_organization_id="${GCP_ORG_ID}"
  export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.config/portefaix/portefaix-bootstrap.json"

  # Get credentials from Infisical and write to file if it doesn't exist
  if [ ! -f "${GOOGLE_APPLICATION_CREDENTIALS}" ]; then
    get_infisical_secret "GCP_CREDENTIALS_JSON" "${path}" "GCP_CREDENTIALS_JSON" || return 1
    if [ -n "${GCP_CREDENTIALS_JSON}" ]; then
      log_debug "[cloudprovider] Create Google Cloud credentials file"
      echo "${GCP_CREDENTIALS_JSON}" | base64 -d >"${GOOGLE_APPLICATION_CREDENTIALS}"
      chmod 600 "${GOOGLE_APPLICATION_CREDENTIALS}"
    else
      log_error "[cloudprovider] Failed to retrieve Google Cloud credentials from Infisical"
      return 1
    fi
  fi

  if [ -f "${GOOGLE_APPLICATION_CREDENTIALS}" ]; then
    TF_VAR_credentials=$(<"${GOOGLE_APPLICATION_CREDENTIALS}" tr -d '\n')
    export TF_VAR_credentials
    export TF_VAR_master_authorized_networks="[{\"cidr_block\": \"${HOME_IP}/32\", \"display_name\": \"Home\"}]"
  else
    log_error "[cloudprovider] Google Cloud credentials file not exists"
    return 1
  fi
}

# AWS
function setup_aws() {
  log_info "[cloudprovider] AWS"
  local path="/aws"
  get_infisical_secret "AWS_ACCESS_KEY" "${path}" "AWS_ACCESS_KEY" || return 1
  get_infisical_secret "AWS_SECRET_ACCESS_KEY" "${path}" "AWS_SECRET_ACCESS_KEY" || return 1
  get_infisical_secret "AWS_DEFAULT_REGION" "${path}" "AWS_DEFAULT_REGION" || return 1
  get_infisical_secret "AWS_ORG_EMAIL" "${path}" "TF_VAR_org_email" || return 1
  get_infisical_secret "AWS_ORG_EMAIL_DOMAIN" "${path}" "TF_VAR_org_email_domain" || return 1
  get_infisical_secret "AWS_ORG_ADMIN_USERNAME" "${path}" "TF_VAR_org_admin_username" || return 1
  get_infisical_secret "SLACK_WEBHOOK_NOTIFS" "/slack" "TF_VAR_slack_webhook_url" || return 1
  export AWS_REGION="${AWS_DEFAULT_REGION}"
  # For Terraform Cloud
  export TF_VAR_access_key="${AWS_ACCESS_KEY_ID}"
  export TF_VAR_secret_key="${AWS_SECRET_ACCESS_KEY}"
  export TF_VAR_admin_ipv4="[\"${HOME_IP}/32\"]" # for WAF
}

# Azure
function setup_azure() {
  log_info "[cloudprovider] Azure"
  local path="/azure"
  get_infisical_secret "ARM_SUBSCRIPTION_ID" "${path}" "ARM_SUBSCRIPTION_ID" || return 1
  get_infisical_secret "ARM_TENANT_ID" "${path}" "ARM_TENANT_ID" || return 1
  get_infisical_secret "ARM_CLIENT_ID" "${path}" "ARM_CLIENT_ID" || return 1
  get_infisical_secret "ARM_CLIENT_SECRET" "${path}" "ARM_CLIENT_SECRET" || return 1
  get_infisical_secret "ARM_BILLING_ACCOUNT_ID" "${path}" "TF_VAR_billing_account_name" || return 1
  # For Inspec
  export AZURE_SUBSCRIPTION_ID="${ARM_SUBSCRIPTION_ID}"
  export AZURE_CLIENT_ID="${ARM_CLIENT_ID}"
  export AZURE_CLIENT_SECRET="${ARM_CLIENT_SECRET}"
  export AZURE_TENANT_ID="${ARM_TENANT_ID}"
  # For Terraform Cloud
  export TF_VAR_arm_subscription_id="${ARM_SUBSCRIPTION_ID}"
  export TF_VAR_arm_client_id="${ARM_CLIENT_ID}"
  export TF_VAR_arm_client_secret="${ARM_CLIENT_SECRET}"
  export TF_VAR_arm_tenant_id="${ARM_TENANT_ID}"
  export TF_VAR_api_server_authorized_ip_ranges="[\"${HOME_IP}\"]"
  export TF_VAR_authorized_ip_ranges="[\"${HOME_IP}\"]"
}

# Digital Ocean
function setup_digitalocean() {
  log_info "[cloudprovider] DigitalOcean"
  local path="/digitalocean"
  get_infisical_secret "DIGITALOCEAN_TOKEN" "${path}" "DIGITALOCEAN_TOKEN" || return 1
  # For Terraform Cloud
  export TF_VAR_env_do_token="${DIGITALOCEAN_TOKEN}"
}

# Scaleway
function setup_scaleway() {
  log_info "[cloudprovider] Scaleway"
  local path="/scaleway"
  get_infisical_secret "SCW_DEFAULT_ORGANIZATION_ID" "${path}" "SCW_DEFAULT_ORGANIZATION_ID" || return 1
  get_infisical_secret "SCW_DEFAULT_PROJECT_ID" "${path}" "SCW_DEFAULT_PROJECT_ID" || return 1
  get_infisical_secret "SCW_ACCESS_KEY" "${path}" "SCW_ACCESS_KEY" || return 1
  get_infisical_secret "SCW_SECRET_KEY" "${path}" "SCW_SECRET_KEY" || return 1
  get_infisical_secret "SCW_REGION" "${path}" "SCW_REGION" || return 1

  export AWS_ACCESS_KEY_ID="${SCW_ACCESS_KEY}"
  export AWS_SECRET_ACCESS_KEY="${SCW_SECRET_KEY}"
  export AWS_DEFAULT_REGION="${SCW_REGION}"
  export AWS_REGION="${AWS_DEFAULT_REGION}"
  # For Terraform Cloud, Spacelift, ...
  export TF_VAR_scw_access_key="${SCW_ACCESS_KEY}"
  export TF_VAR_scw_secret_key="${SCW_SECRET_KEY}"
  export TF_VAR_scw_project_id="${SCW_DEFAULT_PROJECT_ID}"
  export TF_VAR_scw_default_project_id="${SCW_DEFAULT_PROJECT_ID}"
  export TF_VAR_scw_default_organization_id="${SCW_DEFAULT_ORGANIZATION_ID}"
  export TF_VAR_aws_access_key_id="${AWS_ACCESS_KEY_ID}"
  export TF_VAR_aws_secret_access_key="${AWS_SECRET_ACCESS_KEY}"
  export TF_VAR_aws_default_region="${AWS_DEFAULT_REGION}"
  export TF_VAR_aws_region="${AWS_REGION}"
  export TF_VAR_project_id="${SCW_DEFAULT_PROJECT_ID}"
}

# Alicloud
function setup_alicloud() {
  log_info "[cloudprovider] Alicloud"
  local path="/alicloud"
  get_infisical_secret "ALICLOUD_ACCESS_KEY" "${path}" "ALICLOUD_ACCESS_KEY" || return 1
  get_infisical_secret "ALICLOUD_SECRET_KEY" "${path}" "ALICLOUD_SECRET_KEY" || return 1
  get_infisical_secret "ALICLOUD_REGION" "${path}" "ALICLOUD_REGION" || return 1

  # For Terraform Cloud
  export TF_VAR_access_key="${ALICLOUD_ACCESS_KEY}"
  export TF_VAR_secret_key="${ALICLOUD_SECRET_KEY}"
  export TF_VAR_region="${ALICLOUD_REGION}"
}

# Exoscale
function setup_exoscale() {
  log_info "[cloudprovider] Exoscale"
  local path="/exoscale"
  get_infisical_secret "EXOSCALE_API_KEY" "${path}" "EXOSCALE_API_KEY" || return 1
  get_infisical_secret "EXOSCALE_API_SECRET" "${path}" "EXOSCALE_API_SECRET" || return 1
  get_infisical_secret "EXOSCALE_REGION" "${path}" "EXOSCALE_REGION" || return 1

  export AWS_ACCESS_KEY_ID="${EXOSCALE_API_KEY}"
  export AWS_SECRET_ACCESS_KEY="${EXOSCALE_API_SECRET}"
  export AWS_REGION="${EXOSCALE_REGION}"
  export AWS_DEFAULT_REGION="${AWS_REGION}"
  # For Terraform Cloud, Spacelift, ...
  export TF_VAR_exo_api_key="${EXOSCALE_API_KEY}"
  export TF_VAR_exo_api_secret="${EXOSCALE_API_SECRET}"
  export TF_VAR_aws_access_key_id="${AWS_ACCESS_KEY_ID}"
  export TF_VAR_aws_secret_access_key="${AWS_SECRET_ACCESS_KEY}"
  export TF_VAR_aws_default_region="${AWS_DEFAULT_REGION}"
  export TF_VAR_aws_region="${AWS_REGION}"
}

# IBM Cloud
function setup_ibmcloud() {
  log_info "[cloudprovider] IBMCloud"
  local path="/ibmcloud"
  get_infisical_secret "IAAS_CLASSIC_USERNAME" "${path}" "IAAS_CLASSIC_USERNAME" || return 1
  get_infisical_secret "IC_API_KEY" "${path}" "IC_API_KEY" || return 1
  get_infisical_secret "IAAS_CLASSIC_API_KEY" "${path}" "IAAS_CLASSIC_API_KEY" || return 1
}

# Oracle Cloud
function setup_oci() {
  log_info "[cloudprovider] OracleCloud"
  local path="/oraclecloud"
  get_infisical_secret "OCI_TENANCY_OCID" "${path}" "TF_VAR_tenancy_ocid" || return 1
  get_infisical_secret "OCI_COMPARTMENT_PARENT_ID" "${path}" "OCI_COMPARTMENT_PARENT_ID" || return 1
  get_infisical_secret "OCI_USER_OCID" "${path}" "TF_VAR_user_ocid" || return 1
  get_infisical_secret "OCI_FINGERPRINT" "${path}" "TF_VAR_fingerprint" || return 1
  get_infisical_secret "AWS_ACCESS_KEY_ID" "${path}" "AWS_ACCESS_KEY_ID" || return 1
  get_infisical_secret "AWS_SECRET_ACCESS_KEY" "${path}" "AWS_SECRET_ACCESS_KEY" || return 1
  get_infisical_secret "AWS_REGION" "${path}" "AWS_REGION" || return 1

  # Handle private key - retrieve from Infisical and write to file if it doesn't exist
  local oci_private_key_path="${HOME}/.oci/oci_api_key.pem"
  if [ ! -f "${oci_private_key_path}" ]; then
    log_debug "[cloudprovider] Create OCI private key"
    get_infisical_secret "OCI_PRIVATE_KEY" "${path}" "OCI_PRIVATE_KEY" || return 1
    if [ -n "${OCI_PRIVATE_KEY}" ]; then
      mkdir -p "$(dirname "${oci_private_key_path}")"
      echo "${OCI_PRIVATE_KEY}" | base64 -d >"${oci_private_key_path}"
      chmod 600 "${oci_private_key_path}"
    else
      log_error "[cloudprovider] Failed to create private key"
      return 1
    fi
  fi

  TF_VAR_private_key="$(cat "${oci_private_key_path}")"
  export TF_VAR_private_key
  # For Terraform Backend S3
  export TF_VAR_control_plane_allowed_cidrs="[\"${HOME_IP}/32\"]"
}

function setup_civo() {
  log_info "[cloudprovider] Civo"
  local path="/civo"
  get_infisical_secret "CIVO_TOKEN" "${path}" "CIVO_TOKEN" || return 1

  export TF_VAR_authorized_networks="[\"${HOME_IP}/32\"]"
  # For Terraform Cloud
  export TF_VAR_env_authorized_networks="${TF_VAR_authorized_networks}"
}

function setup_vultr() {
  log_info "[cloudprovider] Vultr"
  local path="/vultr"
  get_infisical_secret "VULTR_API_KEY" "${path}" "VULTR_API_KEY" || return 1

  # For Terraform Cloud
  export TF_VAR_env_vultr_api_key="${VULTR_API_KEY}"
}

function setup_cloud_provider {
  cleanup
  case $1 in
  "gcp")
    setup_gcp
    ;;
  "aws")
    setup_aws
    ;;
  "azure")
    setup_azure
    ;;
  "digitalocean")
    setup_digitalocean
    setup_cloudflare
    ;;
  "scaleway")
    setup_scaleway
    ;;
  "alicloud")
    setup_alicloud
    ;;
  "exoscale")
    setup_exoscale
    ;;
  "ibmcloud")
    setup_ibmcloud
    ;;
  "oci")
    setup_oci
    ;;
  "kind") ;;
  "k3s")
    # setup_tailscale
    # setup_freebox
    setup_cloudflare
    ;;
  "talos")
    # setup_tailscale
    # setup_freebox
    setup_cloudflare
    ;;
  "civo")
    setup_civo
    setup_cloudflare
    ;;
  "vultr")
    setup_vultr
    setup_cloudflare
    ;;
  *)
    log_error "invalid cloud provider: $1"
    usage
    ;;
  esac
}

function main() {
  if [ $# -ne 1 ]; then
    usage
    return 1
  fi

  # Validate Infisical setup before proceeding
  if ! validate_infisical_setup; then
    log_error "Infisical validation failed. Cannot proceed."
    return 1
  fi

  setup_flux || {
    log_error "Failed to setup Flux configuration"
    return 1
  }

  setup_pagerduty || {
    log_error "Failed to setup PagerDuty configuration"
    return 1
  }

  setup_terraform_cloud || {
    log_error "Failed to setup Terraform Cloud configuration"
    return 1
  }

  setup_spacelift || {
    log_error "Failed to setup SpaceLift configuration"
    return 1
  }

  setup_env0 || {
    log_error "Failed to setup Env0 configuration"
    return 1
  }

  setup_scalr || {
    log_error "Failed to setup Scalr configuration"
    return 1
  }

  setup_grafana_cloud || {
    log_error "Failed to setup Grafana Cloud configuration"
    return 1
  }

  setup_cloud_provider "$1" || {
    log_error "Failed to setup $1 configuration"
    return 1
  }

  echo -e "${color_green}🚀 [portefaix] Successfully configured environment for: $1${reset_color}"
}

main "$1"
