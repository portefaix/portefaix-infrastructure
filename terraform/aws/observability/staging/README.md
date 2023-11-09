## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | 4.47.0   |

## Providers

No providers.

## Modules

| Name                                                                       | Source                   | Version |
| -------------------------------------------------------------------------- | ------------------------ | ------- |
| <a name="module_observability"></a> [observability](#module_observability) | ../modules/observability | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                              | Description                           | Type           | Default                                                                                                      | Required |
| ----------------------------------------------------------------------------------------------------------------- | ------------------------------------- | -------------- | ------------------------------------------------------------------------------------------------------------ | :------: |
| <a name="input_amp_alias"></a> [amp\_alias](#input_amp_alias)                                                     | AWS Managed Prometheus workspace name | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_amp_tags"></a> [amp\_tags](#input_amp_tags)                                                        | Tags for AMP                          | `map(string)`  | n/a                                                                                                          |   yes    |
| <a name="input_cluster_name"></a> [cluster\_name](#input_cluster_name)                                            | Name of the EKS cluster               | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_core_account_id"></a> [core\_account\_id](#input_core_account_id)                                  | ID of the Core AWS Account            | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_default_tags"></a> [default\_tags](#input_default_tags)                                            | Tags for the AWS provider             | `map(string)`  | <pre>{<br> "Made-By": "Terraform",<br> "Portefaix-Version": "v0.41.0",<br> "Project": "Portefaix"<br>}</pre> |    no    |
| <a name="input_grafana_namespace"></a> [grafana\_namespace](#input_grafana_namespace)                             | The Kubernetes namespace              | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_grafana_service_account"></a> [grafana\_service\_account](#input_grafana_service_account)          | The Kubernetes service account        | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_grafana_tags"></a> [grafana\_tags](#input_grafana_tags)                                            | Tags for Grafana                      | `map(string)`  | n/a                                                                                                          |   yes    |
| <a name="input_loki_enable_kms"></a> [loki\_enable\_kms](#input_loki_enable_kms)                                  | Enable custom KMS key                 | `bool`         | n/a                                                                                                          |   yes    |
| <a name="input_loki_namespace"></a> [loki\_namespace](#input_loki_namespace)                                      | The Kubernetes namespace              | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_loki_service_account"></a> [loki\_service\_account](#input_loki_service_account)                   | The Kubernetes service account        | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_loki_tags"></a> [loki\_tags](#input_loki_tags)                                                     | Tags for Loki                         | `map(string)`  | n/a                                                                                                          |   yes    |
| <a name="input_org_name"></a> [org\_name](#input_org_name)                                                        | Name of the AWS Organization          | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_prometheus_enable_kms"></a> [prometheus\_enable\_kms](#input_prometheus_enable_kms)                | Enable custom KMS key                 | `bool`         | n/a                                                                                                          |   yes    |
| <a name="input_prometheus_namespace"></a> [prometheus\_namespace](#input_prometheus_namespace)                    | The Kubernetes namespace              | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_prometheus_service_account"></a> [prometheus\_service\_account](#input_prometheus_service_account) | The Kubernetes service account        | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_prometheus_tags"></a> [prometheus\_tags](#input_prometheus_tags)                                   | Tags for Prometheus                   | `map(string)`  | n/a                                                                                                          |   yes    |
| <a name="input_region"></a> [region](#input_region)                                                               | AWS Region                            | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_tempo_enable_kms"></a> [tempo\_enable\_kms](#input_tempo_enable_kms)                               | Enable custom KMS key                 | `bool`         | n/a                                                                                                          |   yes    |
| <a name="input_tempo_namespace"></a> [tempo\_namespace](#input_tempo_namespace)                                   | The Kubernetes namespace              | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_tempo_service_account"></a> [tempo\_service\_account](#input_tempo_service_account)                | The Kubernetes service account        | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_tempo_tags"></a> [tempo\_tags](#input_tempo_tags)                                                  | Tags for Tempo                        | `map(string)`  | n/a                                                                                                          |   yes    |
| <a name="input_thanos_enable_kms"></a> [thanos\_enable\_kms](#input_thanos_enable_kms)                            | Enable custom KMS key                 | `bool`         | n/a                                                                                                          |   yes    |
| <a name="input_thanos_namespace"></a> [thanos\_namespace](#input_thanos_namespace)                                | The Kubernetes namespace              | `string`       | n/a                                                                                                          |   yes    |
| <a name="input_thanos_service_accounts"></a> [thanos\_service\_accounts](#input_thanos_service_accounts)          | The Kubernetes service account        | `list(string)` | n/a                                                                                                          |   yes    |
| <a name="input_thanos_tags"></a> [thanos\_tags](#input_thanos_tags)                                               | Tags for Thanos                       | `map(string)`  | n/a                                                                                                          |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
