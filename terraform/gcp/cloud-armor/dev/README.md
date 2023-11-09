## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement_google)          | 4.46.0   |

## Providers

No providers.

## Modules

| Name                                                                  | Source                 | Version |
| --------------------------------------------------------------------- | ---------------------- | ------- |
| <a name="module_cloud_armor"></a> [cloud\_armor](#module_cloud_armor) | ../modules/cloud-armor | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                       | Description                                                               | Type           | Default                           | Required |
| -------------------------------------------------------------------------- | ------------------------------------------------------------------------- | -------------- | --------------------------------- | :------: |
| <a name="input_ip_white_list"></a> [ip\_white\_list](#input_ip_white_list) | A list of ip addresses that can be white listed through security policies | `list(string)` | <pre>[<br> "0.0.0.0/0"<br>]</pre> |    no    |
| <a name="input_project"></a> [project](#input_project)                     | The project in which the resource belongs                                 | `string`       | n/a                               |   yes    |
| <a name="input_region"></a> [region](#input_region)                        | The location linked to the project                                        | `string`       | n/a                               |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
