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
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The Azure Region where the Resource Group should exist | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Name which should be used for this Resource Group | `string` | n/a | yes |
| <a name="input_subscription_core_dev_id"></a> [subscription\_core\_dev\_id](#input\_subscription\_core\_dev\_id) | The Subscription ID for Core Dev resources | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | <pre>{<br>  "made-by": "terraform"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_loki_user_assigned_identity_id"></a> [loki\_user\_assigned\_identity\_id](#output\_loki\_user\_assigned\_identity\_id) | ID of the user assigned identity |
| <a name="output_loki_user_assigned_identity_name"></a> [loki\_user\_assigned\_identity\_name](#output\_loki\_user\_assigned\_identity\_name) | Name of the user assigned identity |
| <a name="output_prometheus_user_assigned_identity_id"></a> [prometheus\_user\_assigned\_identity\_id](#output\_prometheus\_user\_assigned\_identity\_id) | ID of the user assigned identity |
| <a name="output_prometheus_user_assigned_identity_name"></a> [prometheus\_user\_assigned\_identity\_name](#output\_prometheus\_user\_assigned\_identity\_name) | Name of the user assigned identity |
| <a name="output_tempo_user_assigned_identity_id"></a> [tempo\_user\_assigned\_identity\_id](#output\_tempo\_user\_assigned\_identity\_id) | ID of the user assigned identity |
| <a name="output_tempo_user_assigned_identity_name"></a> [tempo\_user\_assigned\_identity\_name](#output\_tempo\_user\_assigned\_identity\_name) | Name of the user assigned identity |
| <a name="output_thanos_user_assigned_identity_id"></a> [thanos\_user\_assigned\_identity\_id](#output\_thanos\_user\_assigned\_identity\_id) | ID of the user assigned identity |
| <a name="output_thanos_user_assigned_identity_name"></a> [thanos\_user\_assigned\_identity\_name](#output\_thanos\_user\_assigned\_identity\_name) | Name of the user assigned identity |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
