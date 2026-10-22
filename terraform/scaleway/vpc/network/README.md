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
| [scaleway_vpc_gateway_network.transit](https://registry.terraform.io/providers/scaleway/scaleway/2.87.0/docs/resources/vpc_gateway_network) | resource |
| [scaleway_vpc_private_network.management](https://registry.terraform.io/providers/scaleway/scaleway/2.87.0/docs/resources/vpc_private_network) | resource |
| [scaleway_vpc_private_network.shared_services](https://registry.terraform.io/providers/scaleway/scaleway/2.87.0/docs/resources/vpc_private_network) | resource |
| [scaleway_vpc_private_network.transit](https://registry.terraform.io/providers/scaleway/scaleway/2.87.0/docs/resources/vpc_private_network) | resource |
| [scaleway_vpc_public_gateway.this](https://registry.terraform.io/providers/scaleway/scaleway/2.87.0/docs/resources/vpc_public_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_public_gateway"></a> [enable\_public\_gateway](#input\_enable\_public\_gateway) | Attach a Public Gateway to the hub transit Private Network for internet egress. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name prefix for the hub VPC and its Private Networks. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The Scaleway Project the hub belongs to. This is the network Project created by terraform/scaleway/root. | `string` | n/a | yes |
| <a name="input_public_gateway_type"></a> [public\_gateway\_type](#input\_public\_gateway\_type) | The hub Public Gateway commercial type. | `string` | `"VPC-GW-S"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region that will be used as default value for all resources. | `string` | n/a | yes |
| <a name="input_subnet_cidrs"></a> [subnet\_cidrs](#input\_subnet\_cidrs) | IPv4 subnet CIDR for each hub Private Network (keys: transit, shared\_services, management). | `map(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to every resource created by this stack. | `list(string)` | <pre>[<br>  "terraform",<br>  "portefaix",<br>  "hub"<br>]</pre> | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone that will be used as default value for all resources. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_network_ids"></a> [private\_network\_ids](#output\_private\_network\_ids) | IDs of the hub Private Networks. |
| <a name="output_public_gateway_id"></a> [public\_gateway\_id](#output\_public\_gateway\_id) | ID of the hub Public Gateway, if created. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the hub VPC. Copy this into the dev/staging/prod stacks' tfvars as hub\_vpc\_id. |
<!-- END_TF_DOCS -->
