## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | 4.47.0   |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 4.34.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/4.47.0/docs/resources/secretsmanager_secret)                 | resource |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/4.47.0/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name                                                                                                        | Description                                 | Type          | Default                                      | Required |
| ----------------------------------------------------------------------------------------------------------- | ------------------------------------------- | ------------- | -------------------------------------------- | :------: |
| <a name="input_name"></a> [name](#input_name)                                                               | Name of the secret                          | `string`      | n/a                                          |   yes    |
| <a name="input_portefaix_version_secret"></a> [portefaix\_version\_secret](#input_portefaix_version_secret) | Version of Portefaix to store into a secret | `string`      | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                               | Tags for AWS resources                      | `map(string)` | <pre>{<br> "Made-By": "terraform"<br>}</pre> |    no    |

## Outputs

| Name                                                                     | Description                         |
| ------------------------------------------------------------------------ | ----------------------------------- |
| <a name="output_secret_arn"></a> [secret\_arn](#output_secret_arn)       | Amazon Resource Name of the secret. |
| <a name="output_secret_value"></a> [secret\_value](#output_secret_value) | Secret value                        |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
