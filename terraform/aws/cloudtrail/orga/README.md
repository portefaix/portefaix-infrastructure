## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.29.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudtrail"></a> [cloudtrail](#module\_cloudtrail) | ../modules/cloudtrail | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_audit_account_id"></a> [audit\_account\_id](#input\_audit\_account\_id) | ID of the Audit AWS Account | `string` | n/a | yes |
| <a name="input_cloudtrail_bucket_name"></a> [cloudtrail\_bucket\_name](#input\_cloudtrail\_bucket\_name) | Bucket name of Cloudtrail logs | `string` | n/a | yes |
| <a name="input_cloudtrail_logging"></a> [cloudtrail\_logging](#input\_cloudtrail\_logging) | Enables logging for the trail | `bool` | n/a | yes |
| <a name="input_cloudtrail_topic_name"></a> [cloudtrail\_topic\_name](#input\_cloudtrail\_topic\_name) | SNS topic name of Cloudtrail | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Tags for the AWS provider | `map(string)` | <pre>{<br>  "Made-By": "Terraform",<br>  "Portefaix-Version": "v0.41.0",<br>  "Project": "Portefaix"<br>}</pre> | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Name of the AWS Organization | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for AWS resources | `map(string)` | <pre>{<br>  "Service": "Cloudtrail"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
