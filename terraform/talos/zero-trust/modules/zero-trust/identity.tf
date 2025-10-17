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

# resource "cloudflare_zero_trust_access_identity_provider" "google_oauth" {
#   account_id = var.cloudflare_account_id
#   name       = "Sign in with Google"
#   type       = "google"

#   config = {
#     client_id     = var.google_oauth_client_id
#     client_secret = var.google_oauth_client_secret
#     email_claim_name = "email"
#     pkce_enabled  = true
#   }
# }

# resource "cloudflare_zero_trust_access_identity_provider" "authentik_oidc" {
#   account_id = var.cloudflare_account_id
#   name       = "Authentik OIDC"
#   type       = "oidc"
#   config {
#     auth_url         = format("https://authentik.%s/application/o/authorize/", data.cloudflare_zone.this.name)
#     certs_url        = format("https://authentik.%s/application/o/cloudflare-access/jwks/", data.cloudflare_zone.this.name)
#     claims           = ["given_name", "preferred_username", "nickname", "groups", "role"]
#     client_id        = var.authentik_oidc_client_id
#     client_secret    = var.authentik_oidc_secret
#     email_claim_name = "email"
#     scopes           = ["openid", "email", "profile", "offline_access"]
#     token_url        = format("https://authentik.%s/application/o/token/", data.cloudflare_zone.this.name)
#     pkce_enabled     = true
#   }
#   scim_config {
#     secret                   = var.authentik_scim_secret
#     enabled                  = true
#     user_deprovision         = true
#     seat_deprovision         = true
#     identity_update_behavior = "automatic"
#   }
# }
