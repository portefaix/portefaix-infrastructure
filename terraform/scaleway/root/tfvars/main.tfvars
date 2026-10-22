#####################################################################
# Provider

region = "fr-par"

zone = "fr-par-1"

#####################################################################
# Organization

project_prefix = "portefaix"

environments = ["dev", "staging", "prod"]

network_project_name = "network"

#####################################################################
# IAM

admin_group_name = "PortefaixAdministrators"

spacelift_application_name = "spacelift"

#####################################################################
# Billing

budget_consumption_limit = 90

# Budget limit of 1 per organization reached
budget_alert_thresholds = [] # [5, 10, 50, 100]

budget_alert_emails = []
