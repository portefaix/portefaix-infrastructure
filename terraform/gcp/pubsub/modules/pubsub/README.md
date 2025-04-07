## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement_google)          | 4.84.0   |

## Providers

No providers.

## Modules

| Name                                                  | Source                                 | Version |
| ----------------------------------------------------- | -------------------------------------- | ------- |
| <a name="module_pubsub"></a> [pubsub](#module_pubsub) | terraform-google-modules/pubsub/google | 5.0.0   |

## Resources

No resources.

## Inputs

| Name                                                                                        | Description                                             | Type          | Default | Required |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_project"></a> [project](#input_project)                                      | The project in which the resource belongs               | `string`      | n/a     |   yes    |
| <a name="input_subscription_labels"></a> [subscription\_labels](#input_subscription_labels) | A map of labels to assign to every Pub/Sub subscription | `map(string)` | n/a     |   yes    |
| <a name="input_topic"></a> [topic](#input_topic)                                            | The Pub/Sub topic name                                  | `string`      | n/a     |   yes    |
| <a name="input_topic_labels"></a> [topic\_labels](#input_topic_labels)                      | A map of labels to assign to the Pub/Sub topic          | `map(string)` | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
