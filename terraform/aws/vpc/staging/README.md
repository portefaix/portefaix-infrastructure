## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | 4.47.0   |

## Providers

No providers.

## Modules

| Name                                         | Source         | Version |
| -------------------------------------------- | -------------- | ------- |
| <a name="module_vpc"></a> [vpc](#module_vpc) | ../modules/vpc | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                         | Description                                                                            | Type          | Default                                                                                                      | Required |
| -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------ | :------: |
| <a name="input_core_account_id"></a> [core\_account\_id](#input_core_account_id)             | ID of the Core AWS Account                                                             | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_default_tags"></a> [default\_tags](#input_default_tags)                       | Tags for the AWS provider                                                              | `map(string)` | <pre>{<br> "Made-By": "Terraform",<br> "Portefaix-Version": "v0.41.0",<br> "Project": "Portefaix"<br>}</pre> |    no    |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input_eks_cluster_name)          | The name of your EKS Cluster                                                           | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input_enable_nat_gateway)    | Should be true if you want to provision NAT Gateways for each of your private networks | `bool`        | n/a                                                                                                          |   yes    |
| <a name="input_igw_tags"></a> [igw\_tags](#input_igw_tags)                                   | Tags for Internet NAT Gateway                                                          | `map(string)` | <pre>{<br> "Service": "Internet Gateway"<br>}</pre>                                                          |    no    |
| <a name="input_org_name"></a> [org\_name](#input_org_name)                                   | Name of the AWS Organization                                                           | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_private_subnet_cidr"></a> [private\_subnet\_cidr](#input_private_subnet_cidr) | Private Subnet CIDR                                                                    | `list(any)`   | <pre>[<br> "10.0.0.0/19",<br> "10.0.32.0/19",<br> "10.0.64.0/19"<br>]</pre>                                  |    no    |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input_private_subnet_tags) | Tags for private subnets                                                               | `map(string)` | <pre>{<br> "Service": "Subnets"<br>}</pre>                                                                   |    no    |
| <a name="input_public_subnet_cidr"></a> [public\_subnet\_cidr](#input_public_subnet_cidr)    | Public Subnet CIDR                                                                     | `list(any)`   | <pre>[<br> "10.0.128.0/20",<br> "10.0.144.0/20",<br> "10.0.160.0/20"<br>]</pre>                              |    no    |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input_public_subnet_tags)    | Tags for public subnets                                                                | `map(string)` | <pre>{<br> "Service": "Subnets"<br>}</pre>                                                                   |    no    |
| <a name="input_region"></a> [region](#input_region)                                          | AWS Region                                                                             | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_vpc_name"></a> [vpc\_name](#input_vpc_name)                                   | Name of the VPC                                                                        | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_vpc_subnet_cidr"></a> [vpc\_subnet\_cidr](#input_vpc_subnet_cidr)             | The VPC Subnet CIDR                                                                    | `string`      | `"10.0.0.0/16"`                                                                                              |    no    |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input_vpc_tags)                                   | Tags for VPC                                                                           | `map(string)` | <pre>{<br> "Service": "VPC"<br>}</pre>                                                                       |    no    |

## Outputs

| Name                                                                              | Description                                                       |
| --------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| <a name="output_azs"></a> [azs](#output_azs)                                      | A list of availability zones spefified as argument to this module |
| <a name="output_nat_public_ips"></a> [nat\_public\_ips](#output_nat_public_ips)   | List of public Elastic IPs created for AWS NAT Gateway            |
| <a name="output_private_subnets"></a> [private\_subnets](#output_private_subnets) | List of IDs of private subnets                                    |
| <a name="output_public_subnets"></a> [public\_subnets](#output_public_subnets)    | List of IDs of public subnets                                     |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output_vpc_cidr_block)   | The CIDR block of the VPC                                         |
| <a name="output_vpc_id"></a> [vpc\_id](#output_vpc_id)                            | The ID of the VPC                                                 |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
