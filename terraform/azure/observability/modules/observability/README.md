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

| Name                                                              | Source                                               | Version |
| ----------------------------------------------------------------- | ---------------------------------------------------- | ------- |
| <a name="module_loki"></a> [loki](#module_loki)                   | nlamirault/observability/azurerm//modules/loki       | 2.0.0   |
| <a name="module_mimir"></a> [mimir](#module_mimir)                | nlamirault/observability/azurerm//modules/mimir      | 2.0.0   |
| <a name="module_prometheus"></a> [prometheus](#module_prometheus) | nlamirault/observability/azurerm//modules/prometheus | 2.0.0   |
| <a name="module_tempo"></a> [tempo](#module_tempo)                | nlamirault/observability/azurerm//modules/tempo/     | 2.0.0   |

## Resources

| Name                                                                                                                             | Type        |
| -------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name                                                                                                              | Description                                            | Type          | Default                                      | Required |
| ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------ | ------------- | -------------------------------------------- | :------: |
| <a name="input_cluster_name"></a> [cluster\_name](#input_cluster_name)                                            | Name of the EKS cluster                                | `string`      | n/a                                          |   yes    |
| <a name="input_cluster_rg_name"></a> [cluster\_rg\_name](#input_cluster_rg_name)                                  | The AKS cluster resource group name                    | `string`      | n/a                                          |   yes    |
| <a name="input_loki_namespace"></a> [loki\_namespace](#input_loki_namespace)                                      | The Kubernetes namespace                               | `string`      | n/a                                          |   yes    |
| <a name="input_loki_service_account"></a> [loki\_service\_account](#input_loki_service_account)                   | The Kubernetes service account                         | `string`      | n/a                                          |   yes    |
| <a name="input_loki_tags"></a> [loki\_tags](#input_loki_tags)                                                     | A mapping of tags to assign to the resource.           | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_mimir_namespace"></a> [mimir\_namespace](#input_mimir_namespace)                                   | The Kubernetes namespace                               | `string`      | n/a                                          |   yes    |
| <a name="input_mimir_service_account"></a> [mimir\_service\_account](#input_mimir_service_account)                | The Kubernetes service account                         | `string`      | n/a                                          |   yes    |
| <a name="input_mimir_tags"></a> [mimir\_tags](#input_mimir_tags)                                                  | A mapping of tags to assign to the resource.           | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_prometheus_namespace"></a> [prometheus\_namespace](#input_prometheus_namespace)                    | The Kubernetes namespace                               | `string`      | n/a                                          |   yes    |
| <a name="input_prometheus_service_account"></a> [prometheus\_service\_account](#input_prometheus_service_account) | The Kubernetes service account                         | `string`      | n/a                                          |   yes    |
| <a name="input_prometheus_tags"></a> [prometheus\_tags](#input_prometheus_tags)                                   | A mapping of tags to assign to the resource.           | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_tempo_namespace"></a> [tempo\_namespace](#input_tempo_namespace)                                   | The Kubernetes namespace                               | `string`      | n/a                                          |   yes    |
| <a name="input_tempo_service_account"></a> [tempo\_service\_account](#input_tempo_service_account)                | The Kubernetes service account                         | `string`      | n/a                                          |   yes    |
| <a name="input_tempo_tags"></a> [tempo\_tags](#input_tempo_tags)                                                  | A mapping of tags to assign to the resource.           | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input_resource_group_location)          | The Azure Region where the Resource Group should exist | `string`      | n/a                                          |   yes    |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input_resource_group_name)                      | The Name which should be used for this Resource Group  | `string`      | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                     | A mapping of tags to assign to the resource.           | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
