resource "cloudflare_zero_trust_access_policy" "admins" {
  account_id       = var.cloudflare_account_id
  name             = "Allow Administrators"
  decision         = "allow"
  session_duration = "48h"

  include = [{
    group = {
      id = cloudflare_zero_trust_access_group.admins.id
    }
  }]
}

resource "cloudflare_zero_trust_access_group" "admins" {
  account_id = var.cloudflare_account_id
  name       = "Administrators"

  include = [
    {
      email = {
        email = var.cloudflare_email
      }
    }
  ]
}

# resource "cloudflare_zero_trust_access_group" "portefaix" {
#   account_id = var.cloudflare_account_id
#   name       = "Portefaix"

#   include = [
#     {
#       email_domain = {
#         domain = var.portefaix_domain
#       }
#     }
#   ]
# }
