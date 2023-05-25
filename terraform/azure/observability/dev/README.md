## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.57.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_observability"></a> [observability](#module\_observability) | ../modules/observability | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the AKS cluster | `string` | n/a | yes |
| <a name="input_cluster_rg_name"></a> [cluster\_rg\_name](#input\_cluster\_rg\_name) | The AKS cluster resource group name | `string` | n/a | yes |
| <a name="input_loki_namespace"></a> [loki\_namespace](#input\_loki\_namespace) | The Kubernetes namespace | `string` | n/a | yes |
| <a name="input_loki_service_account"></a> [loki\_service\_account](#input\_loki\_service\_account) | The Kubernetes service account | `string` | n/a | yes |
| <a name="input_loki_tags"></a> [loki\_tags](#input\_loki\_tags) | A mapping of tags to assign to the resource. | `map(string)` | <pre>{<br>  "made-by": "terraform"<br>}</pre> | no |
| <a name="input_mimir_namespace"></a> [mimir\_namespace](#input\_mimir\_namespace) | The Kubernetes namespace | `string` | n/a | yes |
| <a name="input_mimir_service_account"></a> [mimir\_service\_account](#input\_mimir\_service\_account) | The Kubernetes service account | `string` | n/a | yes |
| <a name="input_mimir_tags"></a> [mimir\_tags](#input\_mimir\_tags) | A mapping of tags to assign to the resource. | `map(string)` | <pre>{<br>  "made-by": "terraform"<br>}</pre> | no |
| <a name="input_prometheus_namespace"></a> [prometheus\_namespace](#input\_prometheus\_namespace) | The Kubernetes namespace | `string` | n/a | yes |
| <a name="input_prometheus_service_account"></a> [prometheus\_service\_account](#input\_prometheus\_service\_account) | The Kubernetes service account | `string` | n/a | yes |
| <a name="input_prometheus_tags"></a> [prometheus\_tags](#input\_prometheus\_tags) | A mapping of tags to assign to the resource. | `map(string)` | <pre>{<br>  "made-by": "terraform"<br>}</pre> | no |
| <a name="input_tempo_namespace"></a> [tempo\_namespace](#input\_tempo\_namespace) | The Kubernetes namespace | `string` | n/a | yes |
| <a name="input_tempo_service_account"></a> [tempo\_service\_account](#input\_tempo\_service\_account) | The Kubernetes service account | `string` | n/a | yes |
| <a name="input_tempo_tags"></a> [tempo\_tags](#input\_tempo\_tags) | A mapping of tags to assign to the resource. | `map(string)` | <pre>{<br>  "made-by": "terraform"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
