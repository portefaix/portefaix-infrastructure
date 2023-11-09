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

| Name                                                                     | Source                  | Version |
| ------------------------------------------------------------------------ | ----------------------- | ------- |
| <a name="module_cert_manager"></a> [cert\_manager](#module_cert_manager) | ../modules/cert-manager | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                            | Description                               | Type     | Default | Required |
| ------------------------------------------------------------------------------- | ----------------------------------------- | -------- | ------- | :------: |
| <a name="input_namespace"></a> [namespace](#input_namespace)                    | The Kubernetes namespace                  | `string` | n/a     |   yes    |
| <a name="input_project"></a> [project](#input_project)                          | The project in which the resource belongs | `string` | n/a     |   yes    |
| <a name="input_region"></a> [region](#input_region)                             | The location linked to the project        | `string` | n/a     |   yes    |
| <a name="input_service_account"></a> [service\_account](#input_service_account) | The Kubernetes service account            | `string` | n/a     |   yes    |

## Outputs

| Name                                                                              | Description                      |
| --------------------------------------------------------------------------------- | -------------------------------- |
| <a name="output_service_account"></a> [service\_account](#output_service_account) | Service Account for Cert Manager |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
