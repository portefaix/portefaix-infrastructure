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

| Name                                               | Source           | Version |
| -------------------------------------------------- | ---------------- | ------- |
| <a name="module_chaos"></a> [chaos](#module_chaos) | ../modules/chaos | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                      | Description                    | Type          | Default                                                                                                       | Required |
| ----------------------------------------------------------------------------------------- | ------------------------------ | ------------- | ------------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_cluster_name"></a> [cluster\_name](#input_cluster_name)                    | Name of the EKS cluster        | `string`      | n/a                                                                                                           |   yes    |
| <a name="input_default_tags"></a> [default\_tags](#input_default_tags)                    | Tags for the AWS provider      | `map(string)` | <pre>{<br> "Made-By": "Tterraform",<br> "Portefaix-Version": "v0.41.0",<br> "Project": "Portefaix"<br>}</pre> |    no    |
| <a name="input_namespace"></a> [namespace](#input_namespace)                              | The Kubernetes namespace       | `string`      | n/a                                                                                                           |   yes    |
| <a name="input_org_name"></a> [org\_name](#input_org_name)                                | Name of the AWS Organization   | `string`      | n/a                                                                                                           |   yes    |
| <a name="input_region"></a> [region](#input_region)                                       | AWS Region                     | `string`      | n/a                                                                                                           |   yes    |
| <a name="input_service_account"></a> [service\_account](#input_service_account)           | The Kubernetes service account | `string`      | n/a                                                                                                           |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                             | Tags for AWS resources         | `map(string)` | <pre>{<br> "Service": "Chaos"<br>}</pre>                                                                      |    no    |
| <a name="input_testing_account_id"></a> [testing\_account\_id](#input_testing_account_id) | ID of the Testing AWS Account  | `string`      | n/a                                                                                                           |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
