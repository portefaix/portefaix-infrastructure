resource "scaleway_billing_budget" "this" {
  count = length(var.budget_alert_thresholds) > 0 ? 1 : 0

  enabled           = true
  consumption_limit = var.budget_consumption_limit
}

resource "scaleway_billing_budget_alert" "this" {
  for_each = toset([for threshold in var.budget_alert_thresholds : tostring(threshold)])

  budget_id = scaleway_billing_budget.this[0].id
  threshold = tonumber(each.value)
}

resource "scaleway_billing_budget_alert_notification" "email" {
  for_each = scaleway_billing_budget_alert.this

  budget_alert_id = each.value.id
  email_addresses = var.budget_alert_emails
}
