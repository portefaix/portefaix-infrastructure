resource "cloudflare_zero_trust_dex_test" "quad_one" {
  account_id  = var.cloudflare_account_id
  name        = "quad_one"
  description = "Traceroute to 1.1.1.1"
  interval    = "0h30m0s"
  enabled     = true
  data = {
    host = "1.1.1.1"
    kind = "traceroute"
  }
}
