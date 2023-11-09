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

| Name                                         | Source         | Version |
| -------------------------------------------- | -------------- | ------- |
| <a name="module_vpc"></a> [vpc](#module_vpc) | ../modules/vpc | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                     | Description                                                                                                      | Type           | Default                                      | Required |
| ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- | -------------- | -------------------------------------------- | :------: |
| <a name="input_availability_zones"></a> [availability\_zones](#input_availability_zones) | List available zones to launch several VSwitches.                                                                | `list(string)` | n/a                                          |   yes    |
| <a name="input_pod_vswitch_cidrs"></a> [pod\_vswitch\_cidrs](#input_pod_vswitch_cidrs)   | List of pod subnets in CIDR format                                                                               | `list(string)` | n/a                                          |   yes    |
| <a name="input_pod_vswitch_name"></a> [pod\_vswitch\_name](#input_pod_vswitch_name)      | The vswitch name prefix used to launch several new Pod vswitches.                                                | `string`       | n/a                                          |   yes    |
| <a name="input_pod_vswitch_tags"></a> [pod\_vswitch\_tags](#input_pod_vswitch_tags)      | Tags used to launch serveral Pod vswitches                                                                       | `map(string)`  | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_region"></a> [region](#input_region)                                      | Alicloud Region                                                                                                  | `string`       | n/a                                          |   yes    |
| <a name="input_vpc_name"></a> [vpc\_name](#input_vpc_name)                               | Name of the VPC                                                                                                  | `string`       | n/a                                          |   yes    |
| <a name="input_vpc_subnet_cidr"></a> [vpc\_subnet\_cidr](#input_vpc_subnet_cidr)         | The VPC Subnet CIDR                                                                                              | `string`       | n/a                                          |   yes    |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input_vpc_tags)                               | Tags for VPC                                                                                                     | `map(string)`  | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_vswitch_cidrs"></a> [vswitch\_cidrs](#input_vswitch_cidrs)                | List of cidr blocks used to launch several new vswitches. If not set, there is no new vswitches will be created. | `list(string)` | n/a                                          |   yes    |
| <a name="input_vswitch_name"></a> [vswitch\_name](#input_vswitch_name)                   | The vswitch name prefix used to launch several new vswitches.                                                    | `string`       | n/a                                          |   yes    |
| <a name="input_vswitch_tags"></a> [vswitch\_tags](#input_vswitch_tags)                   | Tags used to launch serveral vswitches                                                                           | `map(string)`  | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |

## Outputs

| Name                                                                                     | Description                   |
| ---------------------------------------------------------------------------------------- | ----------------------------- |
| <a name="output_pod_vswitch_ids"></a> [pod\_vswitch\_ids](#output_pod_vswitch_ids)       | List of vswitch ids for pod   |
| <a name="output_pod_vswitch_names"></a> [pod\_vswitch\_names](#output_pod_vswitch_names) | List of vswitch names for pod |
| <a name="output_vpc_id"></a> [vpc\_id](#output_vpc_id)                                   | The VPC id                    |
| <a name="output_vpc_name"></a> [vpc\_name](#output_vpc_name)                             | The VPC name                  |
| <a name="output_vswitch_ids"></a> [vswitch\_ids](#output_vswitch_ids)                    | List of vswitch ids           |
| <a name="output_vswitch_names"></a> [vswitch\_names](#output_vswitch_names)              | List of vswitch names         |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
