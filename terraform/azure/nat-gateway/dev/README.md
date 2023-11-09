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

| Name                                                                  | Source                 | Version |
| --------------------------------------------------------------------- | ---------------------- | ------- |
| <a name="module_nat_gateway"></a> [nat\_gateway](#module_nat_gateway) | ../modules/nat-gateway | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                         | Description                                                | Type          | Default | Required |
| ------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_core_rg_name"></a> [core\_rg\_name](#input_core_rg_name)                                      | Name of the Core resource group.                           | `string`      | n/a     |   yes    |
| <a name="input_core_vnet_name"></a> [core\_vnet\_name](#input_core_vnet_name)                                | The Core virtual network name                              | `string`      | n/a     |   yes    |
| <a name="input_environment"></a> [environment](#input_environment)                                           | Specifies the name of the environment                      | `string`      | n/a     |   yes    |
| <a name="input_organization"></a> [organization](#input_organization)                                        | Specifies the name of the Organization                     | `string`      | n/a     |   yes    |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input_resource_group_location)     | The Azure Region where the Resource Group should exist.    | `string`      | n/a     |   yes    |
| <a name="input_subnet_prefix"></a> [subnet\_prefix](#input_subnet_prefix)                                    | The address prefix to use for the Azure NAT Gateway subnet | `string`      | n/a     |   yes    |
| <a name="input_subscription_core_dev_id"></a> [subscription\_core\_dev\_id](#input_subscription_core_dev_id) | The Subscription ID for Core Dev resources                 | `string`      | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                | The tags to associate with your network and subnets.       | `map(string)` | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
