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

| Name                                                                              | Source                     | Version |
| --------------------------------------------------------------------------------- | -------------------------- | ------- |
| <a name="module_traffic_manager"></a> [traffic\_manager](#module_traffic_manager) | ../modules/traffic-manager | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                         | Description                                                                 | Type          | Default | Required |
| ------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_appgw_westeurope_ip_name"></a> [appgw\_westeurope\_ip\_name](#input_appgw_westeurope_ip_name) | Name of the IP Address for the Application Gateway                          | `string`      | n/a     |   yes    |
| <a name="input_hub_rg_name"></a> [hub\_rg\_name](#input_hub_rg_name)                                         | The name of the resource grupe of the Hub virtual network                   | `string`      | n/a     |   yes    |
| <a name="input_profile_name"></a> [profile\_name](#input_profile_name)                                       | Traffic Manager profile name                                                | `string`      | n/a     |   yes    |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input_resource_group_location)     | The Azure Region where the Resource Group for Traffic Manager should exist. | `string`      | n/a     |   yes    |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input_resource_group_name)                 | Name of the resource group for Traffic Manager                              | `string`      | n/a     |   yes    |
| <a name="input_subscription_network_id"></a> [subscription\_network\_id](#input_subscription_network_id)     | The Subscription ID for Networking resources                                | `string`      | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                | A map of tags to add to all resources                                       | `map(string)` | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
