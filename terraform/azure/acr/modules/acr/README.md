## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm)       | 3.57.0   |

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) | 3.57.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                  | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_container_registry.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/container_registry) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/resource_group)         | resource |

## Inputs

| Name                                                                                                     | Description                                                     | Type                                                                                                        | Default                                      | Required |
| -------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | -------------------------------------------- | :------: |
| <a name="input_environment"></a> [environment](#input_environment)                                       | Name of the environment                                         | `string`                                                                                                    | n/a                                          |   yes    |
| <a name="input_organization"></a> [organization](#input_organization)                                    | Name of the organization.                                       | `string`                                                                                                    | n/a                                          |   yes    |
| <a name="input_repositories"></a> [repositories](#input_repositories)                                    | The ACR repositories                                            | <pre>map(object({<br> retention_policy = object({<br> days = number<br> enabled = bool<br> })<br> }))</pre> | `{}`                                         |    no    |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input_resource_group_location) | The Azure Region where the Resource Group for AKS should exist. | `string`                                                                                                    | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                            | Any tags that should be present on the resources                | `map(string)`                                                                                               | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
