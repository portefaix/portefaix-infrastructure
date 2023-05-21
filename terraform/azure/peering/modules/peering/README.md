## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.57.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm.core"></a> [azurerm.core](#provider\_azurerm.core) | 3.57.0 |
| <a name="provider_azurerm.network"></a> [azurerm.network](#provider\_azurerm.network) | 3.57.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_peering.back](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.go](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_resource_group.core](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.hub](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/data-sources/resource_group) | data source |
| [azurerm_virtual_network.core](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.hub](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_core_rg_name"></a> [core\_rg\_name](#input\_core\_rg\_name) | Name of the Core resource group. | `string` | n/a | yes |
| <a name="input_core_vnet_name"></a> [core\_vnet\_name](#input\_core\_vnet\_name) | The Core virtual network name | `string` | n/a | yes |
| <a name="input_hub_rg_name"></a> [hub\_rg\_name](#input\_hub\_rg\_name) | Name of the Bastion resource group. | `string` | n/a | yes |
| <a name="input_hub_vnet_name"></a> [hub\_vnet\_name](#input\_hub\_vnet\_name) | The Bastion virtual network name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
