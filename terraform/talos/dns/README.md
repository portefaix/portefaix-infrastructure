## Requirements

| Name                                                                        | Version  |
| --------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                      | 5.17.0   |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement_cloudflare) | 4.15.0   |

## Providers

| Name                                                                  | Version |
| --------------------------------------------------------------------- | ------- |
| <a name="provider_cloudflare"></a> [cloudflare](#provider_cloudflare) | 4.15.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                    | Type        |
| ----------------------------------------------------------------------------------------------------------------------- | ----------- |
| [cloudflare_record.homelab](https://registry.terraform.io/providers/cloudflare/cloudflare/4.15.0/docs/resources/record) | resource    |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/4.15.0/docs/data-sources/zone)     | data source |

## Inputs

| Name                                                                                               | Description               | Type     | Default | Required |
| -------------------------------------------------------------------------------------------------- | ------------------------- | -------- | ------- | :------: |
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input_cloudflare_account_id) | The Cloudflare account ID | `string` | n/a     |   yes    |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input_cloudflare_api_token)    | The Cloudflare API token  | `string` | n/a     |   yes    |
| <a name="input_ip_address"></a> [ip\_address](#input_ip_address)                                   | The value of the record   | `string` | n/a     |   yes    |
| <a name="input_name"></a> [name](#input_name)                                                      | Name of the record        | `string` | n/a     |   yes    |
| <a name="input_zone_name"></a> [zone\_name](#input_zone_name)                                      | The name of the zone      | `string` | n/a     |   yes    |

## Outputs

No outputs.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.70.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 4.43.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | The Cloudflare account ID | `string` | n/a | yes |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | The Cloudflare API token | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
