## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | 1.194.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.194.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | alibaba/vpc/alicloud | 1.10.0 |

## Resources

| Name | Type |
|------|------|
| [alicloud_vswitch.pod_vswitch](https://registry.terraform.io/providers/aliyun/alicloud/1.194.0/docs/resources/vswitch) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List available zones to launch several VSwitches. | `list(string)` | n/a | yes |
| <a name="input_pod_vswitch_cidrs"></a> [pod\_vswitch\_cidrs](#input\_pod\_vswitch\_cidrs) | List of pod subnets in CIDR format | `list(string)` | n/a | yes |
| <a name="input_pod_vswitch_name"></a> [pod\_vswitch\_name](#input\_pod\_vswitch\_name) | The vswitch name prefix used to launch several new Pod vswitches. | `string` | n/a | yes |
| <a name="input_pod_vswitch_tags"></a> [pod\_vswitch\_tags](#input\_pod\_vswitch\_tags) | Tags used to launch serveral Pod vswitches | `map(string)` | <pre>{<br>  "made-by": "terraform"<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | Alicloud Region | `string` | n/a | yes |
| <a name="input_vpc_description"></a> [vpc\_description](#input\_vpc\_description) | The vpc description used to launch a new vpc. | `string` | `"Managed by Terraform"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC | `string` | n/a | yes |
| <a name="input_vpc_subnet_cidr"></a> [vpc\_subnet\_cidr](#input\_vpc\_subnet\_cidr) | The VPC Subnet CIDR | `string` | n/a | yes |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | Tags for VPC | `map(string)` | <pre>{<br>  "made-by": "terraform"<br>}</pre> | no |
| <a name="input_vswitch_cidrs"></a> [vswitch\_cidrs](#input\_vswitch\_cidrs) | List of cidr blocks used to launch several new vswitches. If not set, there is no new vswitches will be created. | `list(string)` | n/a | yes |
| <a name="input_vswitch_description"></a> [vswitch\_description](#input\_vswitch\_description) | The vswitch description used to launch several new vswitch. | `string` | `"Managed by Terraform"` | no |
| <a name="input_vswitch_name"></a> [vswitch\_name](#input\_vswitch\_name) | The vswitch name prefix used to launch several new vswitches. | `string` | n/a | yes |
| <a name="input_vswitch_tags"></a> [vswitch\_tags](#input\_vswitch\_tags) | Tags used to launch serveral vswitches | `map(string)` | <pre>{<br>  "made-by": "terraform"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pod_vswitch_ids"></a> [pod\_vswitch\_ids](#output\_pod\_vswitch\_ids) | List of vswitch ids for pod |
| <a name="output_pod_vswitch_names"></a> [pod\_vswitch\_names](#output\_pod\_vswitch\_names) | List of vswitch names for pod |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The VPC id |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | The VPC name |
| <a name="output_vswitch_ids"></a> [vswitch\_ids](#output\_vswitch\_ids) | List of vswitch ids |
| <a name="output_vswitch_names"></a> [vswitch\_names](#output\_vswitch\_names) | List of vswitch names |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
