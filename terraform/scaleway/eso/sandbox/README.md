## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement_scaleway)    | 2.21.0   |

## Providers

No providers.

## Modules

| Name                                         | Source         | Version |
| -------------------------------------------- | -------------- | ------- |
| <a name="module_eso"></a> [eso](#module_eso) | ../modules/eso | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                   | Description                                                      | Type     | Default | Required |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------- | -------- | ------- | :------: |
| <a name="input_cluster_name"></a> [cluster\_name](#input_cluster_name) | Name of the Kapsule cluster                                      | `string` | n/a     |   yes    |
| <a name="input_project_id"></a> [project\_id](#input_project_id)       | ID of the project                                                | `string` | n/a     |   yes    |
| <a name="input_region"></a> [region](#input_region)                    | The region that will be used as default value for all resources. | `string` | n/a     |   yes    |
| <a name="input_zone"></a> [zone](#input_zone)                          | The zone that will be used as default value for all resources    | `string` | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
