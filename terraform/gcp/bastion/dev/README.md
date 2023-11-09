## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement_google)          | 4.84.0   |

## Providers

No providers.

## Modules

| Name                                                                  | Source             | Version |
| --------------------------------------------------------------------- | ------------------ | ------- |
| <a name="module_iap_bastion"></a> [iap\_bastion](#module_iap_bastion) | ../modules/bastion | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                               | Description                                                     | Type           | Default                                                                                                                                          | Required |
| -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | :------: |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input_disk_size_gb)                            | Boot disk size in GB                                            | `string`       | n/a                                                                                                                                              |   yes    |
| <a name="input_disk_type"></a> [disk\_type](#input_disk_type)                                      | Boot disk type, can be either pd-ssd, local-ssd, or pd-standard | `string`       | `"pd-standard"`                                                                                                                                  |    no    |
| <a name="input_labels"></a> [labels](#input_labels)                                                | Key-value map of labels to assign to the bastion host           | `map(string)`  | n/a                                                                                                                                              |   yes    |
| <a name="input_machine_type"></a> [machine\_type](#input_machine_type)                             | Instance type for the Bastion host                              | `string`       | n/a                                                                                                                                              |   yes    |
| <a name="input_members"></a> [members](#input_members)                                             | List of IAM resources to allow access to the bastion host       | `list(string)` | n/a                                                                                                                                              |   yes    |
| <a name="input_metadata"></a> [metadata](#input_metadata)                                          | Key-value map of additional metadata to assign to the instances | `map(string)`  | n/a                                                                                                                                              |   yes    |
| <a name="input_name"></a> [name](#input_name)                                                      | Name of the Bastion instance                                    | `string`       | n/a                                                                                                                                              |   yes    |
| <a name="input_network_name"></a> [network\_name](#input_network_name)                             | Name of the VPC                                                 | `string`       | n/a                                                                                                                                              |   yes    |
| <a name="input_project"></a> [project](#input_project)                                             | The project in which the resource belongs                       | `string`       | n/a                                                                                                                                              |   yes    |
| <a name="input_region"></a> [region](#input_region)                                                | The location linked to the project                              | `string`       | n/a                                                                                                                                              |   yes    |
| <a name="input_scopes"></a> [scopes](#input_scopes)                                                | List of scopes to attach to the bastion host                    | `list(string)` | <pre>[<br> "cloud-platform"<br>]</pre>                                                                                                           |    no    |
| <a name="input_service_account_roles"></a> [service\_account\_roles](#input_service_account_roles) | List of IAM roles to assign to the service account.             | `list(string)` | <pre>[<br> "roles/logging.logWriter",<br> "roles/monitoring.metricWriter",<br> "roles/monitoring.viewer",<br> "roles/compute.osLogin"<br>]</pre> |    no    |
| <a name="input_shielded_vm"></a> [shielded\_vm](#input_shielded_vm)                                | Enable shielded VM on the bastion host (recommended)            | `bool`         | `true`                                                                                                                                           |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                      | Network tags, provided as a list                                | `list(string)` | n/a                                                                                                                                              |   yes    |
| <a name="input_zone"></a> [zone](#input_zone)                                                      | The primary zone where the bastion host will live               | `string`       | n/a                                                                                                                                              |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
