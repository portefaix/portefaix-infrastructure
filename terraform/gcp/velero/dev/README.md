## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement_google)          | 4.46.0   |

## Providers

No providers.

## Modules

| Name                                                  | Source            | Version |
| ----------------------------------------------------- | ----------------- | ------- |
| <a name="module_velero"></a> [velero](#module_velero) | ../modules/velero | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                            | Description                               | Type          | Default                                      | Required |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------- | ------------- | -------------------------------------------- | :------: |
| <a name="input_bucket_labels"></a> [bucket\_labels](#input_bucket_labels)                       | Map of labels to apply to the bucket      | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_bucket_location"></a> [bucket\_location](#input_bucket_location)                 | The bucket location                       | `string`      | n/a                                          |   yes    |
| <a name="input_bucket_storage_class"></a> [bucket\_storage\_class](#input_bucket_storage_class) | Bucket storage class.                     | `string`      | `"MULTI_REGIONAL"`                           |    no    |
| <a name="input_enable_kms"></a> [enable\_kms](#input_enable_kms)                                | Enable custom KMS key                     | `bool`        | n/a                                          |   yes    |
| <a name="input_keyring_location"></a> [keyring\_location](#input_keyring_location)              | The KMS keyring location                  | `string`      | n/a                                          |   yes    |
| <a name="input_namespace"></a> [namespace](#input_namespace)                                    | The Kubernetes namespace                  | `string`      | n/a                                          |   yes    |
| <a name="input_project"></a> [project](#input_project)                                          | The project in which the resource belongs | `string`      | n/a                                          |   yes    |
| <a name="input_region"></a> [region](#input_region)                                             | The location linked to the project        | `string`      | n/a                                          |   yes    |
| <a name="input_service_account"></a> [service\_account](#input_service_account)                 | The Kubernetes service account            | `string`      | n/a                                          |   yes    |

## Outputs

| Name                                                                              | Description                |
| --------------------------------------------------------------------------------- | -------------------------- |
| <a name="output_service_account"></a> [service\_account](#output_service_account) | Service Account for Velero |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
