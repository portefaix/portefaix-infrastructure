## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | 2.16.2 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the cluster | `string` | n/a | yes |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | ID of the existing flexible IP | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region that will be used as default value for all resources. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags associated with the Kubernetes cluster. | `list(string)` | <pre>[<br>  "terraform"<br>]</pre> | no |
| <a name="input_type"></a> [type](#input\_type) | The gateway type | `string` | `"VPC-GW-S"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone that will be used as default value for all resources | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
