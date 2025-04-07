## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement_scaleway)    | 2.16.3   |

## Providers

No providers.

## Modules

| Name                                         | Source         | Version |
| -------------------------------------------- | -------------- | ------- |
| <a name="module_vpc"></a> [vpc](#module_vpc) | ../modules/vpc | n/a     |

## Resources

No resources.

## Inputs

| Name                                                | Description                                                      | Type           | Default                           | Required |
| --------------------------------------------------- | ---------------------------------------------------------------- | -------------- | --------------------------------- | :------: |
| <a name="input_name"></a> [name](#input_name)       | The name of the cluster                                          | `string`       | n/a                               |   yes    |
| <a name="input_region"></a> [region](#input_region) | The region that will be used as default value for all resources. | `string`       | n/a                               |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)       | The tags associated with the Kubernetes cluster.                 | `list(string)` | <pre>[<br> "terraform"<br>]</pre> |    no    |
| <a name="input_type"></a> [type](#input_type)       | The gateway type                                                 | `string`       | `"VPC-GW-S"`                      |    no    |
| <a name="input_zone"></a> [zone](#input_zone)       | The zone that will be used as default value for all resources    | `string`       | n/a                               |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
