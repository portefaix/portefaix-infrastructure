# Documentation

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

| Name                                                                                 | Source                                                              | Version |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------- | ------- |
| <a name="module_irsa_litmuschaos"></a> [irsa\_litmuschaos](#module_irsa_litmuschaos) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 5.9.2   |

## Resources

| Name                                                                                                                                          | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_policy.fis](https://registry.terraform.io/providers/hashicorp/aws/4.47.0/docs/resources/iam_policy)                                  | resource    |
| [aws_iam_policy.litmus](https://registry.terraform.io/providers/hashicorp/aws/4.47.0/docs/resources/iam_policy)                               | resource    |
| [aws_iam_role.fis](https://registry.terraform.io/providers/hashicorp/aws/4.47.0/docs/resources/iam_role)                                      | resource    |
| [aws_iam_role.fis_assume_role](https://registry.terraform.io/providers/hashicorp/aws/4.47.0/docs/resources/iam_role)                          | resource    |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/4.47.0/docs/data-sources/eks_cluster)                            | data source |
| [aws_iam_policy_document.fis](https://registry.terraform.io/providers/hashicorp/aws/4.47.0/docs/data-sources/iam_policy_document)             | data source |
| [aws_iam_policy_document.fis_assume_role](https://registry.terraform.io/providers/hashicorp/aws/4.47.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.litmus](https://registry.terraform.io/providers/hashicorp/aws/4.47.0/docs/data-sources/iam_policy_document)          | data source |

## Inputs

| Name                                                                            | Description                    | Type          | Default                                      | Required |
| ------------------------------------------------------------------------------- | ------------------------------ | ------------- | -------------------------------------------- | :------: |
| <a name="input_cluster_name"></a> [cluster\_name](#input_cluster_name)          | Name of the EKS cluster        | `string`      | n/a                                          |   yes    |
| <a name="input_namespace"></a> [namespace](#input_namespace)                    | The Kubernetes namespace       | `string`      | n/a                                          |   yes    |
| <a name="input_service_account"></a> [service\_account](#input_service_account) | The Kubernetes service account | `string`      | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                   | Tags for AWS resources         | `map(string)` | <pre>{<br> "Made-By": "terraform"<br>}</pre> |    no    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
