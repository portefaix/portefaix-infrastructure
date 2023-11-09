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

| Name                                                              | Source                                              | Version |
| ----------------------------------------------------------------- | --------------------------------------------------- | ------- |
| <a name="module_grafana"></a> [grafana](#module_grafana)          | nlamirault/observability/google//modules/grafana    | 5.4.0   |
| <a name="module_loki"></a> [loki](#module_loki)                   | nlamirault/observability/google//modules/loki       | 5.4.0   |
| <a name="module_prometheus"></a> [prometheus](#module_prometheus) | nlamirault/observability/google//modules/prometheus | 5.4.0   |
| <a name="module_tempo"></a> [tempo](#module_tempo)                | nlamirault/observability/google//modules/tempo      | 5.4.0   |
| <a name="module_thanos"></a> [thanos](#module_thanos)             | nlamirault/observability/google//modules/thanos     | 5.4.0   |

## Resources

No resources.

## Inputs

| Name                                                                                                                           | Description                                 | Type           | Default                                      | Required |
| ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------- | -------------- | -------------------------------------------- | :------: |
| <a name="input_grafana_namespace"></a> [grafana\_namespace](#input_grafana_namespace)                                          | The Kubernetes namespace                    | `string`       | n/a                                          |   yes    |
| <a name="input_grafana_service_account"></a> [grafana\_service\_account](#input_grafana_service_account)                       | The Kubernetes service account              | `string`       | n/a                                          |   yes    |
| <a name="input_loki_bucket_labels"></a> [loki\_bucket\_labels](#input_loki_bucket_labels)                                      | Map of labels to apply to the bucket        | `map(string)`  | n/a                                          |   yes    |
| <a name="input_loki_bucket_location"></a> [loki\_bucket\_location](#input_loki_bucket_location)                                | The bucket location                         | `string`       | n/a                                          |   yes    |
| <a name="input_loki_bucket_storage_class"></a> [loki\_bucket\_storage\_class](#input_loki_bucket_storage_class)                | Bucket storage class.                       | `string`       | `"MULTI_REGIONAL"`                           |    no    |
| <a name="input_loki_enable_kms"></a> [loki\_enable\_kms](#input_loki_enable_kms)                                               | Enable custom KMS key                       | `bool`         | n/a                                          |   yes    |
| <a name="input_loki_keyring_location"></a> [loki\_keyring\_location](#input_loki_keyring_location)                             | The KMS keyring location                    | `string`       | n/a                                          |   yes    |
| <a name="input_loki_keys"></a> [loki\_keys](#input_loki_keys)                                                                  | Key names.                                  | `list(string)` | `[]`                                         |    no    |
| <a name="input_loki_kms_labels"></a> [loki\_kms\_labels](#input_loki_kms_labels)                                               | Map of labels to apply to the KMS resources | `map(string)`  | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_loki_namespace"></a> [loki\_namespace](#input_loki_namespace)                                                   | The Kubernetes namespace                    | `string`       | n/a                                          |   yes    |
| <a name="input_loki_service_account"></a> [loki\_service\_account](#input_loki_service_account)                                | The Kubernetes service account              | `string`       | n/a                                          |   yes    |
| <a name="input_project"></a> [project](#input_project)                                                                         | The project in which the resource belongs   | `string`       | n/a                                          |   yes    |
| <a name="input_prometheus_namespace"></a> [prometheus\_namespace](#input_prometheus_namespace)                                 | The Kubernetes namespace                    | `string`       | n/a                                          |   yes    |
| <a name="input_prometheus_service_account"></a> [prometheus\_service\_account](#input_prometheus_service_account)              | The Kubernetes service account              | `string`       | n/a                                          |   yes    |
| <a name="input_tempo_bucket_labels"></a> [tempo\_bucket\_labels](#input_tempo_bucket_labels)                                   | Map of labels to apply to the bucket        | `map(string)`  | n/a                                          |   yes    |
| <a name="input_tempo_bucket_location"></a> [tempo\_bucket\_location](#input_tempo_bucket_location)                             | The bucket location                         | `string`       | n/a                                          |   yes    |
| <a name="input_tempo_bucket_storage_class"></a> [tempo\_bucket\_storage\_class](#input_tempo_bucket_storage_class)             | Bucket storage class.                       | `string`       | `"MULTI_REGIONAL"`                           |    no    |
| <a name="input_tempo_enable_kms"></a> [tempo\_enable\_kms](#input_tempo_enable_kms)                                            | Enable custom KMS key                       | `bool`         | n/a                                          |   yes    |
| <a name="input_tempo_keyring_location"></a> [tempo\_keyring\_location](#input_tempo_keyring_location)                          | The KMS keyring location                    | `string`       | n/a                                          |   yes    |
| <a name="input_tempo_keys"></a> [tempo\_keys](#input_tempo_keys)                                                               | Key names.                                  | `list(string)` | `[]`                                         |    no    |
| <a name="input_tempo_kms_labels"></a> [tempo\_kms\_labels](#input_tempo_kms_labels)                                            | Map of labels to apply to the KMS resources | `map(string)`  | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_tempo_namespace"></a> [tempo\_namespace](#input_tempo_namespace)                                                | The Kubernetes namespace                    | `string`       | n/a                                          |   yes    |
| <a name="input_tempo_service_account"></a> [tempo\_service\_account](#input_tempo_service_account)                             | The Kubernetes service account              | `string`       | n/a                                          |   yes    |
| <a name="input_thanos_bucket_labels"></a> [thanos\_bucket\_labels](#input_thanos_bucket_labels)                                | Map of labels to apply to the bucket        | `map(string)`  | n/a                                          |   yes    |
| <a name="input_thanos_bucket_location"></a> [thanos\_bucket\_location](#input_thanos_bucket_location)                          | The bucket location                         | `string`       | n/a                                          |   yes    |
| <a name="input_thanos_bucket_storage_class"></a> [thanos\_bucket\_storage\_class](#input_thanos_bucket_storage_class)          | Bucket storage class.                       | `string`       | `"MULTI_REGIONAL"`                           |    no    |
| <a name="input_thanos_enable_kms"></a> [thanos\_enable\_kms](#input_thanos_enable_kms)                                         | Enable custom KMS key                       | `bool`         | n/a                                          |   yes    |
| <a name="input_thanos_keyring_location"></a> [thanos\_keyring\_location](#input_thanos_keyring_location)                       | The KMS keyring location                    | `string`       | n/a                                          |   yes    |
| <a name="input_thanos_keys"></a> [thanos\_keys](#input_thanos_keys)                                                            | Key names.                                  | `list(string)` | `[]`                                         |    no    |
| <a name="input_thanos_kms_labels"></a> [thanos\_kms\_labels](#input_thanos_kms_labels)                                         | Map of labels to apply to the KMS resources | `map(string)`  | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_thanos_namespace"></a> [thanos\_namespace](#input_thanos_namespace)                                             | The Kubernetes namespace                    | `string`       | n/a                                          |   yes    |
| <a name="input_thanos_service_account"></a> [thanos\_service\_account](#input_thanos_service_account)                          | The Kubernetes service account              | `list(string)` | n/a                                          |   yes    |
| <a name="input_thanos_sidecar_service_account"></a> [thanos\_sidecar\_service\_account](#input_thanos_sidecar_service_account) | The Google service account ID of Prometheus | `string`       | n/a                                          |   yes    |

## Outputs

| Name                                                                                                                | Description                    |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| <a name="output_grafana_service_account"></a> [grafana\_service\_account](#output_grafana_service_account)          | Service Account for Grafana    |
| <a name="output_loki_bucket"></a> [loki\_bucket](#output_loki_bucket)                                               | Loki bucket resource           |
| <a name="output_loki_service_account"></a> [loki\_service\_account](#output_loki_service_account)                   | Service Account for Loki       |
| <a name="output_prometheus_service_account"></a> [prometheus\_service\_account](#output_prometheus_service_account) | Service Account for Prometheus |
| <a name="output_tempo_bucket"></a> [tempo\_bucket](#output_tempo_bucket)                                            | Tempo bucket resource          |
| <a name="output_tempo_service_account"></a> [tempo\_service\_account](#output_tempo_service_account)                | Service Account for Tempo      |
| <a name="output_thanos_bucket"></a> [thanos\_bucket](#output_thanos_bucket)                                         | Thanos bucket resource         |
| <a name="output_thanos_service_accounts"></a> [thanos\_service\_accounts](#output_thanos_service_accounts)          | Service Account for Thanos     |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
