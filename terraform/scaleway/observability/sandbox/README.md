## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | 2.11.1 |

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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Kapsule cluster | `string` | n/a | yes |
| <a name="input_loki_tags"></a> [loki\_tags](#input\_loki\_tags) | Tags for Loki | `map(string)` | <pre>{<br>  "Made-By": "terraform"<br>}</pre> | no |
| <a name="input_mimir_tags"></a> [mimir\_tags](#input\_mimir\_tags) | Tags for Mimir | `map(string)` | <pre>{<br>  "Made-By": "terraform"<br>}</pre> | no |
| <a name="input_prometheus_tags"></a> [prometheus\_tags](#input\_prometheus\_tags) | Tags for Prometheus | `map(string)` | <pre>{<br>  "Made-By": "terraform"<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The region that will be used as default value for all resources. | `string` | n/a | yes |
| <a name="input_tempo_tags"></a> [tempo\_tags](#input\_tempo\_tags) | Tags for Tempo | `map(string)` | <pre>{<br>  "Made-By": "terraform"<br>}</pre> | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone that will be used as default value for all resources | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
