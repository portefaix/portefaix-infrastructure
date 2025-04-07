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
| <a name="module_hub"></a> [hub](#module_hub) | ../modules/hub | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                     | Description                                            | Type           | Default                                      | Required |
| -------------------------------------------------------------------------------------------------------- | ------------------------------------------------------ | -------------- | -------------------------------------------- | :------: |
| <a name="input_address_space"></a> [address\_space](#input_address_space)                                | The address space that is used by the virtual network. | `list(string)` | n/a                                          |   yes    |
| <a name="input_organization"></a> [organization](#input_organization)                                    | Name of the organization                               | `string`       | n/a                                          |   yes    |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input_resource_group_location) | The Azure Region where the Resource Group should exist | `string`       | n/a                                          |   yes    |
| <a name="input_subnet_names"></a> [subnet\_names](#input_subnet_names)                                   | A list of public subnets inside the vNet.              | `list(string)` | n/a                                          |   yes    |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input_subnet_prefixes)                          | The address prefix to use for the subnet.              | `list(string)` | n/a                                          |   yes    |
| <a name="input_subscription_network_id"></a> [subscription\_network\_id](#input_subscription_network_id) | The Subscription ID for Networking resources           | `string`       | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                            | The tags to associate with your network and subnets.   | `map(string)`  | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
