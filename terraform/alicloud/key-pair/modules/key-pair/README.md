## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement_alicloud)    | 1.194.0  |

## Providers

| Name                                                            | Version |
| --------------------------------------------------------------- | ------- |
| <a name="provider_alicloud"></a> [alicloud](#provider_alicloud) | 1.194.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                      | Type     |
| ------------------------------------------------------------------------------------------------------------------------- | -------- |
| [alicloud_ecs_key_pair.this](https://registry.terraform.io/providers/aliyun/alicloud/1.194.0/docs/resources/ecs_key_pair) | resource |

## Inputs

| Name                                                                       | Description                      | Type          | Default                                      | Required |
| -------------------------------------------------------------------------- | -------------------------------- | ------------- | -------------------------------------------- | :------: |
| <a name="input_key_pair_name"></a> [key\_pair\_name](#input_key_pair_name) | The key pair's name.             | `string`      | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                              | Tags associated to the resources | `map(string)` | <pre>{<br> "Made-By": "terraform"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
