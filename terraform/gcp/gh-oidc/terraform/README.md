## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement_google)          | 4.46.0   |

## Providers

No providers.

## Modules

| Name                                                      | Source                                                                  | Version |
| --------------------------------------------------------- | ----------------------------------------------------------------------- | ------- |
| <a name="module_gh_oidc"></a> [gh\_oidc](#module_gh_oidc) | terraform-google-modules/github-actions-runners/google//modules/gh-oidc | 3.1.0   |

## Resources

No resources.

## Inputs

| Name                                                                                               | Description                                                                                                                                                | Type                                                                        | Default                  | Required |
| -------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ------------------------ | :------: |
| <a name="input_pool_description"></a> [pool\_description](#input_pool_description)                 | Workload Identity Pool description                                                                                                                         | `string`                                                                    | `"Managed by Terraform"` |    no    |
| <a name="input_pool_display_name"></a> [pool\_display\_name](#input_pool_display_name)             | Workload Identity Pool display name                                                                                                                        | `string`                                                                    | n/a                      |   yes    |
| <a name="input_pool_id"></a> [pool\_id](#input_pool_id)                                            | Workload Identity Pool ID                                                                                                                                  | `string`                                                                    | n/a                      |   yes    |
| <a name="input_project"></a> [project](#input_project)                                             | The project in which the resource belongs                                                                                                                  | `string`                                                                    | n/a                      |   yes    |
| <a name="input_project_id"></a> [project\_id](#input_project_id)                                   | The project id to create Workload Identity Pool                                                                                                            | `string`                                                                    | n/a                      |   yes    |
| <a name="input_provider_description"></a> [provider\_description](#input_provider_description)     | Workload Identity Pool Provider description                                                                                                                | `string`                                                                    | `"Managed by Terraform"` |    no    |
| <a name="input_provider_display_name"></a> [provider\_display\_name](#input_provider_display_name) | Workload Identity Pool Provider display name                                                                                                               | `string`                                                                    | n/a                      |   yes    |
| <a name="input_provider_id"></a> [provider\_id](#input_provider_id)                                | Workload Identity Pool Provider id                                                                                                                         | `string`                                                                    | n/a                      |   yes    |
| <a name="input_region"></a> [region](#input_region)                                                | The location linked to the project                                                                                                                         | `string`                                                                    | n/a                      |   yes    |
| <a name="input_sa_mapping"></a> [sa\_mapping](#input_sa_mapping)                                   | Service Account resource names and corresponding WIF provider attributes. If attribute is set to `*` all identities in the pool are granted access to SAs. | <pre>map(object({<br> sa_name = string<br> attribute = string<br> }))</pre> | `{}`                     |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
