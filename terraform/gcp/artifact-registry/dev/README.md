## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                           | Version  |
| ------------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)       | >= 1.0.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement_google-beta) | 4.46.0   |

## Providers

No providers.

## Modules

| Name                                                                                    | Source                       | Version |
| --------------------------------------------------------------------------------------- | ---------------------------- | ------- |
| <a name="module_artifact_registry"></a> [artifact\_registry](#module_artifact_registry) | ../modules/artifact-registry | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                  | Description                                                 | Type                                                                      | Default                                      | Required |
| --------------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------- | -------------------------------------------- | :------: |
| <a name="input_labels"></a> [labels](#input_labels)                   | Map of maps containing node labels by node-pool name        | `map(string)`                                                             | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_project"></a> [project](#input_project)                | The project in which the resource belongs                   | `string`                                                                  | n/a                                          |   yes    |
| <a name="input_region"></a> [region](#input_region)                   | The location linked to the project                          | `string`                                                                  | n/a                                          |   yes    |
| <a name="input_repositories"></a> [repositories](#input_repositories) | The name of the router in which this NAT will be configured | <pre>map(object({<br> location = string<br> format = string<br> }))</pre> | n/a                                          |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
