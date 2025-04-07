## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement_alicloud)    | 1.194.0  |

## Providers

No providers.

## Modules

| Name                                                         | Source              | Version |
| ------------------------------------------------------------ | ------------------- | ------- |
| <a name="module_key_pair"></a> [key\_pair](#module_key_pair) | ../modules/key-pair | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                       | Description                      | Type          | Default                                      | Required |
| -------------------------------------------------------------------------- | -------------------------------- | ------------- | -------------------------------------------- | :------: |
| <a name="input_key_pair_name"></a> [key\_pair\_name](#input_key_pair_name) | The key pair's name.             | `string`      | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                              | Tags associated to the resources | `map(string)` | <pre>{<br> "Made-By": "terraform"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
