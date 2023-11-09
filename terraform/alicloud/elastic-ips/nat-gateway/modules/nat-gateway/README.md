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

| Name                                                                               | Source                                                                      | Version |
| ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | ------- |
| <a name="module_eip_nat_gateway"></a> [eip\_nat\_gateway](#module_eip_nat_gateway) | terraform-alicloud-modules/eip/alicloud//modules/associate-with-nat-gateway | 1.2.0   |

## Resources

No resources.

## Inputs

| Name                                                                                | Description                               | Type          | Default                                      | Required |
| ----------------------------------------------------------------------------------- | ----------------------------------------- | ------------- | -------------------------------------------- | :------: |
| <a name="input_eip_name"></a> [eip\_name](#input_eip_name)                          | Name of the Elastic IP                    | `string`      | n/a                                          |   yes    |
| <a name="input_isp"></a> [isp](#input_isp)                                          | The line type of the Elastic IP instance. | `string`      | `""`                                         |    no    |
| <a name="input_nat_gateway_name"></a> [nat\_gateway\_name](#input_nat_gateway_name) | Name of the NAT Gateway                   | `string`      | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                       | Tags for Nat Gateway Elastic IP           | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |

## Outputs

| Name                                                                  | Description             |
| --------------------------------------------------------------------- | ----------------------- |
| <a name="output_eip_address"></a> [eip\_address](#output_eip_address) | The Elastic IP address. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
