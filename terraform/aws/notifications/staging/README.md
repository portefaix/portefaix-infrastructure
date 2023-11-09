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

| Name                                                                       | Source                   | Version |
| -------------------------------------------------------------------------- | ------------------------ | ------- |
| <a name="module_notifications"></a> [notifications](#module_notifications) | ../modules/notifications | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                   | Description                                        | Type          | Default                                                                                                      | Required |
| -------------------------------------------------------------------------------------- | -------------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------ | :------: |
| <a name="input_core_account_id"></a> [core\_account\_id](#input_core_account_id)       | ID of the Core AWS Account                         | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_default_tags"></a> [default\_tags](#input_default_tags)                 | Tags for the AWS provider                          | `map(string)` | <pre>{<br> "Made-By": "Terraform",<br> "Portefaix-Version": "v0.41.0",<br> "Project": "Portefaix"<br>}</pre> |    no    |
| <a name="input_org_name"></a> [org\_name](#input_org_name)                             | Name of the AWS Organization                       | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_region"></a> [region](#input_region)                                    | AWS Region                                         | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_slack_channel"></a> [slack\_channel](#input_slack_channel)              | The name of the channel in Slack for notifications | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_slack_username"></a> [slack\_username](#input_slack_username)           | The username that will appear on Slack messages    | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_slack_webhook_url"></a> [slack\_webhook\_url](#input_slack_webhook_url) | The URL of Slack webhook                           | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input_sns_topic_name)          | The name of the SNS topic to create                | `string`      | n/a                                                                                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                          | Tags for AWS resources                             | `map(string)` | <pre>{<br> "Service": "Notifications"<br>}</pre>                                                             |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
