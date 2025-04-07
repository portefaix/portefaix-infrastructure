## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                              | Version  |
| --------------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)          | >= 1.0.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement_digitalocean) | 2.27.1   |

## Providers

No providers.

## Modules

| Name                                                        | Source                       | Version |
| ----------------------------------------------------------- | ---------------------------- | ------- |
| <a name="module_registry"></a> [registry](#module_registry) | ../modules/containerregistry | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                  | Description                                          | Type     | Default   | Required |
| ----------------------------------------------------------------------------------------------------- | ---------------------------------------------------- | -------- | --------- | :------: |
| <a name="input_name"></a> [name](#input_name)                                                         | A name for the VPC                                   | `string` | n/a       |   yes    |
| <a name="input_region"></a> [region](#input_region)                                                   | The DigitalOcean region slug for the VPC's location  | `string` | n/a       |   yes    |
| <a name="input_subscription_tier_slug"></a> [subscription\_tier\_slug](#input_subscription_tier_slug) | The slug identifier for the subscription tier to use | `string` | `"basic"` |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
