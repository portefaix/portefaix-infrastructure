## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm)       | 3.57.0   |

## Providers

No providers.

## Modules

| Name                                                     | Source             | Version |
| -------------------------------------------------------- | ------------------ | ------- |
| <a name="module_monitor"></a> [monitor](#module_monitor) | ../modules/monitor | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                     | Description                                  | Type          | Default                                      | Required |
| -------------------------------------------------------------------------------------------------------- | -------------------------------------------- | ------------- | -------------------------------------------- | :------: |
| <a name="input_location"></a> [location](#input_location)                                                | The location of the azure resources          | `string`      | `"westeurope"`                               |    no    |
| <a name="input_organization"></a> [organization](#input_organization)                                    | The name of the organization                 | `string`      | n/a                                          |   yes    |
| <a name="input_subscription_logging_id"></a> [subscription\_logging\_id](#input_subscription_logging_id) | The Subscription ID for Logging resources    | `string`      | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                            | A mapping of tags to assign to the resource. | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
