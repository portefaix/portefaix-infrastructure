## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.57.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_peering"></a> [peering](#module\_peering) | ../modules/peering | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_core_rg_name"></a> [core\_rg\_name](#input\_core\_rg\_name) | Name of the Core resource group. | `string` | n/a | yes |
| <a name="input_core_vnet_name"></a> [core\_vnet\_name](#input\_core\_vnet\_name) | The Core virtual network name | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment | `string` | n/a | yes |
| <a name="input_hub_rg_name"></a> [hub\_rg\_name](#input\_hub\_rg\_name) | Name of the Bastion resource group. | `string` | n/a | yes |
| <a name="input_hub_vnet_name"></a> [hub\_vnet\_name](#input\_hub\_vnet\_name) | The Bastion virtual network name | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Name of the organization. | `string` | n/a | yes |
| <a name="input_subscription_core_dev_id"></a> [subscription\_core\_dev\_id](#input\_subscription\_core\_dev\_id) | The Subscription ID for Core Dev resources | `string` | n/a | yes |
| <a name="input_subscription_network_id"></a> [subscription\_network\_id](#input\_subscription\_network\_id) | The Subscription ID for Networking resources | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
