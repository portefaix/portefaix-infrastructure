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

| Name                                                                  | Source                 | Version |
| --------------------------------------------------------------------- | ---------------------- | ------- |
| <a name="module_nat_gateway"></a> [nat\_gateway](#module_nat_gateway) | ../modules/nat-gateway | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                   | Description                                  | Type          | Default                                      | Required |
| ---------------------------------------------------------------------- | -------------------------------------------- | ------------- | -------------------------------------------- | :------: |
| <a name="input_name"></a> [name](#input_name)                          | Name of a new nat gateway.                   | `string`      | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                          | Tags for Nat Gateway                         | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_vpc_name"></a> [vpc\_name](#input_vpc_name)             | Name of the VPC where to create nat gateway. | `string`      | n/a                                          |   yes    |
| <a name="input_vswitch_name"></a> [vswitch\_name](#input_vswitch_name) | The vswitch name prefix used.                | `string`      | n/a                                          |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
