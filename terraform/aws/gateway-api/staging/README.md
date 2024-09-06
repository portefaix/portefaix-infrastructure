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
| <a name="module_alb"></a> [alb](#module_alb) | ../modules/alb | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                             | Description                            | Type          | Default                                                                                                      | Required |
| -------------------------------------------------------------------------------- | -------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------ | :------: |
| <a name="input_alb_name"></a> [alb\_name](#input_alb_name)                       | Name of the EKS cluster                | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_alb_tags"></a> [alb\_tags](#input_alb_tags)                       | A map of tags to add to all resources. | `map(string)` | <pre>{<br> "Service": "ALB"<br>}</pre>                                                                       |    no    |
| <a name="input_core_account_id"></a> [core\_account\_id](#input_core_account_id) | ID of the Core AWS Account             | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_default_tags"></a> [default\_tags](#input_default_tags)           | Tags for the AWS provider              | `map(string)` | <pre>{<br> "Made-By": "Terraform",<br> "Portefaix-Version": "v0.41.0",<br> "Project": "Portefaix"<br>}</pre> |    no    |
| <a name="input_org_name"></a> [org\_name](#input_org_name)                       | Name of the AWS Organization           | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_region"></a> [region](#input_region)                              | AWS Region                             | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_vpc_name"></a> [vpc\_name](#input_vpc_name)                       | ID of the VPC                          | `string`      | n/a                                                                                                          |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
