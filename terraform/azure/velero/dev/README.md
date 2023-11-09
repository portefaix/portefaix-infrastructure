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

| Name                                                  | Source            | Version |
| ----------------------------------------------------- | ----------------- | ------- |
| <a name="module_velero"></a> [velero](#module_velero) | ../modules/velero | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                         | Description                                            | Type          | Default                                      | Required |
| ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------ | ------------- | -------------------------------------------- | :------: |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input_resource_group_location)     | The Azure Region where the Resource Group should exist | `string`      | n/a                                          |   yes    |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input_resource_group_name)                 | The Name which should be used for this Resource Group  | `string`      | n/a                                          |   yes    |
| <a name="input_subscription_core_dev_id"></a> [subscription\_core\_dev\_id](#input_subscription_core_dev_id) | The Subscription ID for Core Dev resources             | `string`      | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                | A mapping of tags to assign to the resource.           | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |

## Outputs

| Name                                                                                                                    | Description                        |
| ----------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| <a name="output_user_assigned_identity_id"></a> [user\_assigned\_identity\_id](#output_user_assigned_identity_id)       | ID of the user assigned identity   |
| <a name="output_user_assigned_identity_name"></a> [user\_assigned\_identity\_name](#output_user_assigned_identity_name) | Name of the user assigned identity |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
