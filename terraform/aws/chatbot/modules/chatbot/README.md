## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | 4.48.0   |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 4.34.0  |

## Modules

| Name                                                                 | Source                                         | Version |
| -------------------------------------------------------------------- | ---------------------------------------------- | ------- |
| <a name="module_chatbot"></a> [chatbot](#module_chatbot)             | waveaccounting/chatbot-slack-configuration/aws | 1.1.0   |
| <a name="module_eventbridge"></a> [eventbridge](#module_eventbridge) | terraform-aws-modules/eventbridge/aws          | 1.17.0  |
| <a name="module_sns_topic"></a> [sns\_topic](#module_sns_topic)      | terraform-aws-modules/sns/aws                  | 5.0.0   |

## Resources

| Name                                                                                                                                                      | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_role)                                                 | resource    |
| [aws_iam_role_policy.lambda_invoke](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_role_policy)                          | resource    |
| [aws_iam_role_policy.notifications](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_role_policy)                          | resource    |
| [aws_iam_role_policy_attachment.read_only_access](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_role_policy_attachment) | resource    |
| [aws_iam_role_policy_attachment.support_access](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_role_policy_attachment)   | resource    |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/data-sources/iam_policy_document)                 | data source |
| [aws_iam_policy_document.lambda_invoke](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/data-sources/iam_policy_document)               | data source |
| [aws_iam_policy_document.notifications](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/data-sources/iam_policy_document)               | data source |

## Inputs

| Name                                                                                                   | Description                                                              | Type          | Default                                        | Required |
| ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------- | ---------------------------------------------- | :------: |
| <a name="input_allow_labmda_invoke"></a> [allow\_labmda\_invoke](#input_allow_labmda_invoke)           | Allow users to invoke Lambda functions from Slack.                       | `bool`        | `false`                                        |    no    |
| <a name="input_allow_notifications"></a> [allow\_notifications](#input_allow_notifications)            | Grant read access for CloudWatch to AWS Chatbot.                         | `bool`        | `true`                                         |    no    |
| <a name="input_allow_read_only_access"></a> [allow\_read\_only\_access](#input_allow_read_only_access) | Provide users with read access to all AWS resources from within Slack.   | `bool`        | `false`                                        |    no    |
| <a name="input_allow_support_access"></a> [allow\_support\_access](#input_allow_support_access)        | Allow users to interact with AWS support from Slack.                     | `bool`        | `false`                                        |    no    |
| <a name="input_display_name"></a> [display\_name](#input_display_name)                                 | The display name for the SNS topic                                       | `string`      | `"Managed by Terraform"`                       |    no    |
| <a name="input_log_level"></a> [log\_level](#input_log_level)                                          | Log level AWS Chatbot should use. Possible values are ERROR, INFO, NONE  | `string`      | `"INFO"`                                       |    no    |
| <a name="input_name"></a> [name](#input_name)                                                          | Name of Slack channel configuration in AWS Chatbot.                      | `string`      | n/a                                            |   yes    |
| <a name="input_slack_channel_id"></a> [slack\_channel\_id](#input_slack_channel_id)                    | ID of the Slack channel configure with AWS Chatbot                       | `string`      | n/a                                            |   yes    |
| <a name="input_slack_workspace_id"></a> [slack\_workspace\_id](#input_slack_workspace_id)              | ID of the Slack workspace containing the channel to use with AWS Chatbot | `string`      | n/a                                            |   yes    |
| <a name="input_sns_create_topic"></a> [sns\_create\_topic](#input_sns_create_topic)                    | Whether to create the SNS topic                                          | `bool`        | `true`                                         |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                          | Tags for AWS resources                                                   | `map(string)` | <pre>{<br> "Service": "AWS ChatBot"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
