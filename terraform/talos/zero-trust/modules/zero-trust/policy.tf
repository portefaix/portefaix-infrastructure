resource "cloudflare_zero_trust_access_policy" "allow_core" {
  account_id       = var.cloudflare_account_id
  name             = "Allow email addresses"
  decision         = "allow"
  session_duration = "48h"

  include {
    group = [cloudflare_zero_trust_access_group.email_core.id]
  }
}

resource "cloudflare_zero_trust_access_group" "email_core" {
  account_id = var.cloudflare_account_id
  name       = "Portefaix SRE"

  include {
    email = var.cloudflare_email
  }
}
