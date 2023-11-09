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

| Name                                                                                                                                                                | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [azurerm_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/nat_gateway)                                             | resource    |
| [azurerm_nat_gateway_public_ip_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/nat_gateway_public_ip_association) | resource    |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/public_ip)                                                 | resource    |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/resource_group)                                       | resource    |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/subnet)                                                       | resource    |
| [azurerm_subnet_nat_gateway_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/subnet_nat_gateway_association)       | resource    |
| [azurerm_resource_group.core](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/data-sources/resource_group)                                    | data source |
| [azurerm_virtual_network.core](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/data-sources/virtual_network)                                  | data source |

## Inputs

| Name                                                                                                     | Description                                             | Type          | Default | Required |
| -------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_core_rg_name"></a> [core\_rg\_name](#input_core_rg_name)                                  | Name of the Core resource group.                        | `string`      | n/a     |   yes    |
| <a name="input_core_vnet_name"></a> [core\_vnet\_name](#input_core_vnet_name)                            | The Core virtual network name                           | `string`      | n/a     |   yes    |
| <a name="input_environment"></a> [environment](#input_environment)                                       | Specifies the name of the environment                   | `string`      | n/a     |   yes    |
| <a name="input_organization"></a> [organization](#input_organization)                                    | Specifies the name of the Organization                  | `string`      | n/a     |   yes    |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input_resource_group_location) | The Azure Region where the Resource Group should exist. | `string`      | n/a     |   yes    |
| <a name="input_subnet_prefix"></a> [subnet\_prefix](#input_subnet_prefix)                                | The address prefix to use for the Azure Bastion subnet  | `string`      | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                            | The tags to associate with your network and subnets.    | `map(string)` | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
