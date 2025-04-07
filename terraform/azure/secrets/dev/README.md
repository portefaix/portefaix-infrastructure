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
| <a name="module_secrets"></a> [secrets](#module_secrets) | ../modules/secrets | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                         | Description                                              | Type          | Default                                      | Required |
| ------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------- | ------------- | -------------------------------------------- | :------: |
| <a name="input_aks_resource_group_name"></a> [aks\_resource\_group\_name](#input_aks_resource_group_name)    | The Name which should be used for the AKS Resource Group | `string`      | n/a                                          |   yes    |
| <a name="input_cluster_name"></a> [cluster\_name](#input_cluster_name)                                       | Name of the AKS cluster                                  | `string`      | n/a                                          |   yes    |
| <a name="input_portefaix_version"></a> [portefaix\_version](#input_portefaix_version)                        | Version of Portefaix to store into a secret              | `string`      | n/a                                          |   yes    |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input_resource_group_location)     | The Azure Region where the Resource Group should exist   | `string`      | n/a                                          |   yes    |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input_resource_group_name)                 | Name of the resource group to be imported.               | `string`      | n/a                                          |   yes    |
| <a name="input_subscription_core_dev_id"></a> [subscription\_core\_dev\_id](#input_subscription_core_dev_id) | The Subscription ID for Core Dev resources               | `string`      | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                | The tags to associate with your network and subnets.     | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
