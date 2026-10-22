<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | 2.87.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | 2.87.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scaleway_vpc.this](https://registry.terraform.io/providers/scaleway/scaleway/2.87.0/docs/resources/vpc) | resource |
| [scaleway_vpc_acl.this](https://registry.terraform.io/providers/scaleway/scaleway/2.87.0/docs/resources/vpc_acl) | resource |
| [scaleway_vpc_connector.hub](https://registry.terraform.io/providers/scaleway/scaleway/2.87.0/docs/resources/vpc_connector) | resource |
| [scaleway_vpc_private_network.this](https://registry.terraform.io/providers/scaleway/scaleway/2.87.0/docs/resources/vpc_private_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl_default_policy"></a> [acl\_default\_policy](#input\_acl\_default\_policy) | Default policy applied to traffic that matches no ACL rule. | `string` | `"accept"` | no |
| <a name="input_create_acl"></a> [create\_acl](#input\_create\_acl) | Whether to create a Network ACL on the spoke VPC. | `bool` | `true` | no |
| <a name="input_deny_cidrs"></a> [deny\_cidrs](#input\_deny\_cidrs) | CIDR ranges to explicitly deny, typically the subnets of sibling spokes, so spoke-to-spoke traffic is only possible through the hub. | `list(string)` | `[]` | no |
| <a name="input_enable_transitivity"></a> [enable\_transitivity](#input\_enable\_transitivity) | Enable packets from peered VPCs to transit through this spoke VPC. | `bool` | `false` | no |
| <a name="input_hub_vpc_id"></a> [hub\_vpc\_id](#input\_hub\_vpc\_id) | ID of the hub VPC to connect this spoke to. Set to null to leave the spoke unconnected. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the spoke VPC and its Private Network. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The Scaleway Project the spoke VPC is associated with. | `string` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | The IPv4 subnet CIDR of the spoke Private Network. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to the spoke VPC and Private Network. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connector_id"></a> [connector\_id](#output\_connector\_id) | ID of the VPC Connector to the hub, if created. |
| <a name="output_private_network_id"></a> [private\_network\_id](#output\_private\_network\_id) | ID of the spoke Private Network. |
| <a name="output_subnet_cidr"></a> [subnet\_cidr](#output\_subnet\_cidr) | IPv4 subnet CIDR of the spoke Private Network. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the spoke VPC. |
<!-- END_TF_DOCS -->
