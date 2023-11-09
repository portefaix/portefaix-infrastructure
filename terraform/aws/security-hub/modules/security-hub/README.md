## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | 4.63.0   |

## Providers

| Name                                                               | Version |
| ------------------------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)                   | 4.63.0  |
| <a name="provider_aws.audit"></a> [aws.audit](#provider_aws.audit) | 4.63.0  |

## Modules

| Name                                                                 | Source                                | Version |
| -------------------------------------------------------------------- | ------------------------------------- | ------- |
| <a name="module_eventbridge"></a> [eventbridge](#module_eventbridge) | terraform-aws-modules/eventbridge/aws | 1.17.3  |
| <a name="module_sns_topic"></a> [sns\_topic](#module_sns_topic)      | terraform-aws-modules/sns/aws         | 5.3.0   |

## Resources

| Name                                                                                                                                                                      | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_securityhub_account.this](https://registry.terraform.io/providers/hashicorp/aws/4.63.0/docs/resources/securityhub_account)                                           | resource    |
| [aws_securityhub_member.accounts](https://registry.terraform.io/providers/hashicorp/aws/4.63.0/docs/resources/securityhub_member)                                         | resource    |
| [aws_securityhub_organization_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/4.63.0/docs/resources/securityhub_organization_configuration)     | resource    |
| [aws_securityhub_standards_subscription.aws_foundational](https://registry.terraform.io/providers/hashicorp/aws/4.63.0/docs/resources/securityhub_standards_subscription) | resource    |
| [aws_securityhub_standards_subscription.cis](https://registry.terraform.io/providers/hashicorp/aws/4.63.0/docs/resources/securityhub_standards_subscription)              | resource    |
| [aws_securityhub_standards_subscription.pci_dss](https://registry.terraform.io/providers/hashicorp/aws/4.63.0/docs/resources/securityhub_standards_subscription)          | resource    |
| [aws_region.this](https://registry.terraform.io/providers/hashicorp/aws/4.63.0/docs/data-sources/region)                                                                  | data source |

## Inputs

| Name                                                                                                     | Description                                                  | Type          | Default                                      | Required |
| -------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ | ------------- | -------------------------------------------- | :------: |
| <a name="input_display_name"></a> [display\_name](#input_display_name)                                   | The display name for the SNS topic                           | `string`      | `"Managed by Terraform"`                     |    no    |
| <a name="input_enable_aws_foundational"></a> [enable\_aws\_foundational](#input_enable_aws_foundational) | Enable AWS Foundational Security Best Practices              | `bool`        | n/a                                          |   yes    |
| <a name="input_enable_cis"></a> [enable\_cis](#input_enable_cis)                                         | Enable CIS AWS Foundations                                   | `bool`        | n/a                                          |   yes    |
| <a name="input_enable_pci_dss"></a> [enable\_pci\_dss](#input_enable_pci_dss)                            | Enable Payment Card Industry Data Security Standard (PCI DSS | `bool`        | n/a                                          |   yes    |
| <a name="input_members"></a> [members](#input_members)                                                   | Security Hub members                                         | `map(string)` | n/a                                          |   yes    |
| <a name="input_org_email"></a> [org\_email](#input_org_email)                                            | Email of the AWS Organization                                | `string`      | n/a                                          |   yes    |
| <a name="input_org_email_domain"></a> [org\_email\_domain](#input_org_email_domain)                      | Email domain of the AWS Organization (like gmail.com)        | `string`      | n/a                                          |   yes    |
| <a name="input_org_name"></a> [org\_name](#input_org_name)                                               | Name of the AWS Organization                                 | `string`      | n/a                                          |   yes    |
| <a name="input_service_name"></a> [service\_name](#input_service_name)                                   | Name of the service                                          | `string`      | n/a                                          |   yes    |
| <a name="input_sns_create_topic"></a> [sns\_create\_topic](#input_sns_create_topic)                      | Whether to create the SNS topic                              | `bool`        | `true`                                       |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                            | Tags for AWS resources                                       | `map(string)` | <pre>{<br> "Made-By": "terraform"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
