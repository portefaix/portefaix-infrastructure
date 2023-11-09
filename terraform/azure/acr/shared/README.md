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

| Name                                         | Source         | Version |
| -------------------------------------------- | -------------- | ------- |
| <a name="module_acr"></a> [acr](#module_acr) | ../modules/acr | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                     | Description                                                     | Type                                                                                                        | Default | Required |
| -------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_environment"></a> [environment](#input_environment)                                       | Name of the environment                                         | `string`                                                                                                    | n/a     |   yes    |
| <a name="input_organization"></a> [organization](#input_organization)                                    | Name of the organization.                                       | `string`                                                                                                    | n/a     |   yes    |
| <a name="input_repositories"></a> [repositories](#input_repositories)                                    | The ACR repositories                                            | <pre>map(object({<br> retention_policy = object({<br> days = number<br> enabled = bool<br> })<br> }))</pre> | `{}`    |    no    |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input_resource_group_location) | The Azure Region where the Resource Group for AKS should exist. | `string`                                                                                                    | n/a     |   yes    |
| <a name="input_subscription_shared_id"></a> [subscription\_shared\_id](#input_subscription_shared_id)    | The Subscription ID for Networking resources                    | `string`                                                                                                    | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                            | A map of tags to add to all resources                           | `map(string)`                                                                                               | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
