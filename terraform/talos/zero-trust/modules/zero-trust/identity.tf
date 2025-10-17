resource "cloudflare_zero_trust_access_identity_provider" "pin_login" {
  account_id = var.cloudflare_account_id
  name       = "PIN Login"
  type       = "onetimepin"

  config = {}
}

resource "cloudflare_zero_trust_access_identity_provider" "github_sso" {
  account_id = var.cloudflare_account_id

  name = "GitHub SSO"
  type = "github"

  config = {
    client_id     = var.github_oauth_client_id
    client_secret = var.github_oauth_client_secret
  }
}
