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

| Name                                                     | Source             | Version |
| -------------------------------------------------------- | ------------------ | ------- |
| <a name="module_bastion"></a> [bastion](#module_bastion) | ../modules/bastion | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                    | Description                                                                        | Type          | Default                                                                                                      | Required |
| --------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------ | :------: |
| <a name="input_asg_name"></a> [asg\_name](#input_asg_name)                              | Name of the bastion ASG                                                            | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_asg_tags"></a> [asg\_tags](#input_asg_tags)                              | Tags for the bastion                                                               | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre>                                                                 |    no    |
| <a name="input_core_account_id"></a> [core\_account\_id](#input_core_account_id)        | ID of the Core AWS Account                                                         | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_default_tags"></a> [default\_tags](#input_default_tags)                  | Tags for the AWS provider                                                          | `map(string)` | <pre>{<br> "Made-By": "Terraform",<br> "Portefaix-Version": "v0.41.0",<br> "Project": "Portefaix"<br>}</pre> |    no    |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input_desired_capacity)      | The number of Amazon EC2 instances that should be running in the autoscaling group | `number`      | n/a                                                                                                          |   yes    |
| <a name="input_ec2_ssm_role_name"></a> [ec2\_ssm\_role\_name](#input_ec2_ssm_role_name) | Name of the AWS project                                                            | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_ec2_ssm_tags"></a> [ec2\_ssm\_tags](#input_ec2_ssm_tags)                 | Tags for the bastion                                                               | `map(string)` | <pre>{<br> "Service": "Bastion"<br>}</pre>                                                                   |    no    |
| <a name="input_instance_type"></a> [instance\_type](#input_instance_type)               | The type of the instance to launch                                                 | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_max_size"></a> [max\_size](#input_max_size)                              | The maximum size of the autoscaling group                                          | `number`      | n/a                                                                                                          |   yes    |
| <a name="input_min_size"></a> [min\_size](#input_min_size)                              | The minimum size of the autoscaling group                                          | `number`      | n/a                                                                                                          |   yes    |
| <a name="input_org_name"></a> [org\_name](#input_org_name)                              | Name of the AWS Organization                                                       | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_region"></a> [region](#input_region)                                     | AWS Region                                                                         | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_sg_name"></a> [sg\_name](#input_sg_name)                                 | Name for the security groups                                                       | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_vpc_name"></a> [vpc\_name](#input_vpc_name)                              | ID of the VPC                                                                      | `string`      | n/a                                                                                                          |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
