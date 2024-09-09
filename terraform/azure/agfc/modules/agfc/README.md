## Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.116.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_load_balancer.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/application_load_balancer) | resource |
| [azurerm_application_load_balancer_frontend.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/application_load_balancer_frontend) | resource |
| [azurerm_application_load_balancer_subnet_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/application_load_balancer_subnet_association) | resource |
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.appgw_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_resource_group.core](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/data-sources/resource_group) | data source |
| [azurerm_virtual_network.core](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_core_rg_name"></a> [core\_rg\_name](#input\_core\_rg\_name) | The name of the resource grupe of the Core virtual network | `string` | n/a | yes |
| <a name="input_core_vnet_name"></a> [core\_vnet\_name](#input\_core\_vnet\_name) | The name of the Core virtual network | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Name of the organization. | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The Azure Region where the Resource Group will be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
