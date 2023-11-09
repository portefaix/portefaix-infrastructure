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
| <a name="module_bastion"></a> [bastion](#module_bastion) | ../modules/bastion | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                     | Description                                               | Type          | Default | Required |
| -------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_hub_rg_name"></a> [hub\_rg\_name](#input_hub_rg_name)                                     | The name of the resource grupe of the Hub virtual network | `string`      | n/a     |   yes    |
| <a name="input_hub_vnet_name"></a> [hub\_vnet\_name](#input_hub_vnet_name)                               | The name of the Hub virtual network                       | `string`      | n/a     |   yes    |
| <a name="input_service_name"></a> [service\_name](#input_service_name)                                   | Specifies the name of the Bastion Host                    | `string`      | n/a     |   yes    |
| <a name="input_subnet_prefix"></a> [subnet\_prefix](#input_subnet_prefix)                                | The address prefix to use for the Azure Bastion subnet    | `string`      | n/a     |   yes    |
| <a name="input_subscription_network_id"></a> [subscription\_network\_id](#input_subscription_network_id) | The Subscription ID for Networking resources              | `string`      | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                            | A map of tags to add to all resources                     | `map(string)` | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
