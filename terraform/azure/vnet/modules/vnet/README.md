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

| Name                                            | Source                               | Version |
| ----------------------------------------------- | ------------------------------------ | ------- |
| <a name="module_ssh"></a> [ssh](#module_ssh)    | Azure/network-security-group/azurerm | 4.1.0   |
| <a name="module_vnet"></a> [vnet](#module_vnet) | Azure/vnet/azurerm                   | 4.0.0   |

## Resources

| Name                                                                                                                          | Type     |
| ----------------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_resource_group.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/resource_group) | resource |

## Inputs

| Name                                                                                                     | Description                                                     | Type           | Default                                      | Required |
| -------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | -------------- | -------------------------------------------- | :------: |
| <a name="input_address_space"></a> [address\_space](#input_address_space)                                | The address space that is used by the virtual network.          | `list(string)` | n/a                                          |   yes    |
| <a name="input_authorized_ip_ranges"></a> [authorized\_ip\_ranges](#input_authorized_ip_ranges)          | The IP ranges to whitelist for incoming traffic to the masters. | `list(string)` | n/a                                          |   yes    |
| <a name="input_environment"></a> [environment](#input_environment)                                       | Name of the environment                                         | `string`       | n/a                                          |   yes    |
| <a name="input_organization"></a> [organization](#input_organization)                                    | Name of the organization.                                       | `string`       | n/a                                          |   yes    |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input_resource_group_location) | The Azure Region where the Resource Group should exist          | `string`       | n/a                                          |   yes    |
| <a name="input_subnet_names"></a> [subnet\_names](#input_subnet_names)                                   | A list of public subnets inside the vNet.                       | `list(string)` | n/a                                          |   yes    |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input_subnet_prefixes)                          | The address prefix to use for the subnet.                       | `list(string)` | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                            | The tags to associate with your network and subnets.            | `map(string)`  | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
