## Requirements

| Name                                                                        | Version  |
| --------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                      | 5.17.0   |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement_cloudflare) | 4.15.0   |
| <a name="requirement_random"></a> [random](#requirement_random)             | 3.5.1    |

## Providers

| Name                                                                  | Version |
| --------------------------------------------------------------------- | ------- |
| <a name="provider_cloudflare"></a> [cloudflare](#provider_cloudflare) | 4.15.0  |
| <a name="provider_random"></a> [random](#provider_random)             | 3.5.1   |

## Modules

No modules.

## Resources

| Name                                                                                                                                                             | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [cloudflare_access_application.this](https://registry.terraform.io/providers/cloudflare/cloudflare/4.15.0/docs/resources/access_application)                     | resource    |
| [cloudflare_access_identity_provider.github_oauth](https://registry.terraform.io/providers/cloudflare/cloudflare/4.15.0/docs/resources/access_identity_provider) | resource    |
| [cloudflare_access_policy.user](https://registry.terraform.io/providers/cloudflare/cloudflare/4.15.0/docs/resources/access_policy)                               | resource    |
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/4.15.0/docs/resources/record)                                             | resource    |
| [cloudflare_tunnel.this](https://registry.terraform.io/providers/cloudflare/cloudflare/4.15.0/docs/resources/tunnel)                                             | resource    |
| [random_id.tunnel_secret](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/id)                                                      | resource    |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/4.15.0/docs/data-sources/zone)                                              | data source |

## Inputs

| Name                                                                                                               | Description                                     | Type           | Default | Required |
| ------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------- | -------------- | ------- | :------: |
| <a name="input_applications"></a> [applications](#input_applications)                                              | A list of applications                          | `list(string)` | `[]`    |    no    |
| <a name="input_cloud"></a> [cloud](#input_cloud)                                                                   | The name of the Cloud Provider                  | `string`       | n/a     |   yes    |
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input_cloudflare_account_id)                 | The Cloudflare account ID                       | `string`       | n/a     |   yes    |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input_cloudflare_api_token)                    | The Cloudflare API token                        | `string`       | n/a     |   yes    |
| <a name="input_environment"></a> [environment](#input_environment)                                                 | The name of the Environment                     | `string`       | n/a     |   yes    |
| <a name="input_github_oauth_client_id"></a> [github\_oauth\_client\_id](#input_github_oauth_client_id)             | Client ID from the Github OAuth application     | `string`       | n/a     |   yes    |
| <a name="input_github_oauth_client_secret"></a> [github\_oauth\_client\_secret](#input_github_oauth_client_secret) | Client secret from the Github OAuth application | `string`       | n/a     |   yes    |
| <a name="input_name"></a> [name](#input_name)                                                                      | Name of the Cloudflare Tunnel                   | `string`       | n/a     |   yes    |
| <a name="input_zone_name"></a> [zone\_name](#input_zone_name)                                                      | The name of the zone                            | `string`       | n/a     |   yes    |

## Outputs

No outputs.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.70.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 4.43.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.30.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_access_application.this](https://registry.terraform.io/providers/cloudflare/cloudflare/4.43.0/docs/resources/access_application) | resource |
| [cloudflare_access_identity_provider.github_oauth](https://registry.terraform.io/providers/cloudflare/cloudflare/4.43.0/docs/resources/access_identity_provider) | resource |
| [cloudflare_access_policy.user](https://registry.terraform.io/providers/cloudflare/cloudflare/4.43.0/docs/resources/access_policy) | resource |
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/4.43.0/docs/resources/record) | resource |
| [cloudflare_tunnel.this](https://registry.terraform.io/providers/cloudflare/cloudflare/4.43.0/docs/resources/tunnel) | resource |
| [random_id.tunnel_secret](https://registry.terraform.io/providers/hashicorp/random/3.6.3/docs/resources/id) | resource |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/4.43.0/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_applications"></a> [applications](#input\_applications) | A list of applications | `list(string)` | `[]` | no |
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | The Cloudflare account ID | `string` | n/a | yes |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | The Cloudflare API token | `string` | n/a | yes |
| <a name="input_github_oauth_client_id"></a> [github\_oauth\_client\_id](#input\_github\_oauth\_client\_id) | Client ID from the Github OAuth application | `string` | n/a | yes |
| <a name="input_github_oauth_client_secret"></a> [github\_oauth\_client\_secret](#input\_github\_oauth\_client\_secret) | Client secret from the Github OAuth application | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Cloudflare Tunnel | `string` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | The name of the zone | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
