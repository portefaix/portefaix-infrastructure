## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.17.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | ../modules/eks | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_addons"></a> [cluster\_addons](#input\_cluster\_addons) | Map of cluster addon configurations to enable for the cluster. Addon name can be the map keys or set with `name` | `any` | `{}` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster | `string` | n/a | yes |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | A map of tags to add to just the eks resource. | `map(string)` | <pre>{<br>  "Role": "EKS Cluster"<br>}</pre> | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The EKS Kubernetes version | `string` | n/a | yes |
| <a name="input_core_account_id"></a> [core\_account\_id](#input\_core\_account\_id) | ID of the Core AWS Account | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Tags for the AWS provider | `map(string)` | <pre>{<br>  "Made-By": "Terraform",<br>  "Portefaix-Version": "v0.41.0",<br>  "Project": "Portefaix"<br>}</pre> | no |
| <a name="input_fargate_profile_name"></a> [fargate\_profile\_name](#input\_fargate\_profile\_name) | The name of the Fargate profile | `string` | `"fargate"` | no |
| <a name="input_fargate_selectors"></a> [fargate\_selectors](#input\_fargate\_selectors) | List of fargate selectors | `list(map(string))` | <pre>[<br>  {<br>    "namespace": "karpenter"<br>  }<br>]</pre> | no |
| <a name="input_fargate_tags"></a> [fargate\_tags](#input\_fargate\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_karpenter_namespace"></a> [karpenter\_namespace](#input\_karpenter\_namespace) | The K8s namespace for resources | `string` | `"kube-system"` | no |
| <a name="input_karpenter_queue_name"></a> [karpenter\_queue\_name](#input\_karpenter\_queue\_name) | Name of the SQS queue | `string` | n/a | yes |
| <a name="input_karpenter_role_name"></a> [karpenter\_role\_name](#input\_karpenter\_role\_name) | The name of the Karpenter controller IAM role | `string` | `"karpenter"` | no |
| <a name="input_karpenter_sa_name"></a> [karpenter\_sa\_name](#input\_karpenter\_sa\_name) | Controller name | `string` | `"karpenter"` | no |
| <a name="input_karpenter_tags"></a> [karpenter\_tags](#input\_karpenter\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Name of the AWS Organization | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. Tags added to launch configuration or templates override these values for ASG Tags only. | `map(string)` | <pre>{<br>  "Service": "Kubernetes"<br>}</pre> | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | ID of the VPC | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
