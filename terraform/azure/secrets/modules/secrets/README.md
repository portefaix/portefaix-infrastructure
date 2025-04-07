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

| Name                                                                                                                                                 | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/key_vault)                                  | resource    |
| [azurerm_key_vault_access_policy.aks](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/key_vault_access_policy)       | resource    |
| [azurerm_key_vault_access_policy.terraform](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/key_vault_access_policy) | resource    |
| [azurerm_key_vault_secret.version](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/key_vault_secret)                 | resource    |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/resource_group)                        | resource    |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/data-sources/client_config)                    | data source |
| [azurerm_kubernetes_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/data-sources/kubernetes_cluster)             | data source |

## Inputs

| Name                                                                                                        | Description                                              | Type          | Default                                      | Required |
| ----------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- | ------------- | -------------------------------------------- | :------: |
| <a name="input_aks_resource_group_name"></a> [aks\_resource\_group\_name](#input_aks_resource_group_name)   | The Name which should be used for the AKS Resource Group | `string`      | n/a                                          |   yes    |
| <a name="input_cluster_name"></a> [cluster\_name](#input_cluster_name)                                      | Name of the AKS cluster                                  | `string`      | n/a                                          |   yes    |
| <a name="input_portefaix_version_secret"></a> [portefaix\_version\_secret](#input_portefaix_version_secret) | Version of Portefaix to store into a secret              | `string`      | n/a                                          |   yes    |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input_resource_group_location)    | The Azure Region where the Resource Group should exist   | `string`      | n/a                                          |   yes    |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input_resource_group_name)                | Name of the resource group to be imported.               | `string`      | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                               | The tags to associate with your secret                   | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
