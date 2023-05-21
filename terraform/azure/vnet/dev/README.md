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
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ../modules/vnet | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used by the virtual network. | `list(string)` | n/a | yes |
| <a name="input_authorized_ip_ranges"></a> [authorized\_ip\_ranges](#input\_authorized\_ip\_ranges) | The IP ranges to whitelist for incoming traffic to the masters. | `list(string)` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The Azure Region where the Resource Group should exist | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to be imported. | `string` | n/a | yes |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | A list of public subnets inside the vNet. | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | The address prefix to use for the subnet. | `list(string)` | n/a | yes |
| <a name="input_subscription_core_dev_id"></a> [subscription\_core\_dev\_id](#input\_subscription\_core\_dev\_id) | The Subscription ID for Core Dev resources | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with your network and subnets. | `map(string)` | <pre>{<br>  "made-by": "terraform"<br>}</pre> | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The virtual network name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
