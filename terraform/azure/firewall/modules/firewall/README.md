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

| Name                                                                                                                                                                              | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [azurerm_firewall.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/firewall)                                                                 | resource    |
| [azurerm_firewall_application_rule_collection.aksbasics](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/firewall_application_rule_collection)    | resource    |
| [azurerm_firewall_application_rule_collection.publicimages](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/firewall_application_rule_collection) | resource    |
| [azurerm_firewall_network_rule_collection.dns](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/firewall_network_rule_collection)                  | resource    |
| [azurerm_firewall_network_rule_collection.servicetags](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/firewall_network_rule_collection)          | resource    |
| [azurerm_firewall_network_rule_collection.time](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/firewall_network_rule_collection)                 | resource    |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/public_ip)                                                               | resource    |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/subnet)                                                                     | resource    |
| [azurerm_resource_group.hub](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/data-sources/resource_group)                                                   | data source |
| [azurerm_virtual_network.hub](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/data-sources/virtual_network)                                                 | data source |

## Inputs

| Name                                                                       | Description                                               | Type          | Default | Required |
| -------------------------------------------------------------------------- | --------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_hub_rg_name"></a> [hub\_rg\_name](#input_hub_rg_name)       | The name of the resource grupe of the Hub virtual network | `string`      | n/a     |   yes    |
| <a name="input_hub_vnet_name"></a> [hub\_vnet\_name](#input_hub_vnet_name) | The name of the Hub virtual network                       | `string`      | n/a     |   yes    |
| <a name="input_organization"></a> [organization](#input_organization)      | Specifies the name of the Organization                    | `string`      | n/a     |   yes    |
| <a name="input_subnet_prefix"></a> [subnet\_prefix](#input_subnet_prefix)  | The address prefix to use for the Azure Firewall subnet   | `string`      | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                              | A map of tags to add to all resources                     | `map(string)` | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
