## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement_google)          | 4.46.0   |

## Providers

No providers.

## Modules

| Name                                                                                                                             | Source                                                     | Version |
| -------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- | ------- |
| <a name="module_terraform-google-secret-manager"></a> [terraform-google-secret-manager](#module_terraform-google-secret-manager) | github.com/mineiros-io/terraform-google-secret-manager.git | v0.2.0  |

## Resources

No resources.

## Inputs

| Name                                                          | Description                                                                                                                                                                                    | Type          | Default | Required |
| ------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_labels"></a> [labels](#input_labels)           | Key-value map of labels to assign to the secret                                                                                                                                                | `map(string)` | n/a     |   yes    |
| <a name="input_project"></a> [project](#input_project)        | The project in which the resource belongs                                                                                                                                                      | `string`      | n/a     |   yes    |
| <a name="input_region"></a> [region](#input_region)           | The location linked to the project                                                                                                                                                             | `string`      | n/a     |   yes    |
| <a name="input_replicas"></a> [replicas](#input_replicas)     | A list of replicas for the secret will be replicated in according to the location set in the location property. If empty The Secret will automatically be replicated without any restrictions. | `any`         | `[]`    |    no    |
| <a name="input_secret_id"></a> [secret\_id](#input_secret_id) | The resource name of the folder the policy is attached to. Its format is folders/{folder\_id}.                                                                                                 | `string`      | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
