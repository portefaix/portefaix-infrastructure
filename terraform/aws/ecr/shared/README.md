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
| <a name="module_ecr"></a> [ecr](#module_ecr) | ../modules/ecr | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                   | Description                  | Type                                                                         | Default                                                                                                      | Required |
| -------------------------------------------------------------------------------------- | ---------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | :------: |
| <a name="input_default_tags"></a> [default\_tags](#input_default_tags)                 | Tags for the AWS provider    | `map(string)`                                                                | <pre>{<br> "Made-By": "Terraform",<br> "Portefaix-Version": "v0.41.0",<br> "Project": "Portefaix"<br>}</pre> |    no    |
| <a name="input_org_name"></a> [org\_name](#input_org_name)                             | Name of the AWS Organization | `string`                                                                     | n/a                                                                                                          |   yes    |
| <a name="input_region"></a> [region](#input_region)                                    | AWS Region                   | `string`                                                                     | n/a                                                                                                          |   yes    |
| <a name="input_repositories"></a> [repositories](#input_repositories)                  | The AWS ECR repositories     | <pre>map(object({<br> immutable = bool<br> scan_on_push = bool<br> }))</pre> | n/a                                                                                                          |   yes    |
| <a name="input_shared_account_id"></a> [shared\_account\_id](#input_shared_account_id) | ID of the AWS Shared Account | `string`                                                                     | n/a                                                                                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                          | Tags for AWS resources       | `map(string)`                                                                | <pre>{<br> "Service": "ECR"<br>}</pre>                                                                       |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
