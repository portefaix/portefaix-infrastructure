## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.28.0 |
| <a name="provider_aws.audit"></a> [aws.audit](#provider\_aws.audit) | 5.28.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eventbridge"></a> [eventbridge](#module\_eventbridge) | terraform-aws-modules/eventbridge/aws | 3.0.0 |
| <a name="module_s3_bucket_ipset"></a> [s3\_bucket\_ipset](#module\_s3\_bucket\_ipset) | terraform-aws-modules/s3-bucket/aws | 3.15.1 |
| <a name="module_s3_bucket_ipset_log"></a> [s3\_bucket\_ipset\_log](#module\_s3\_bucket\_ipset\_log) | terraform-aws-modules/s3-bucket/aws | 3.15.1 |
| <a name="module_sns_topic"></a> [sns\_topic](#module\_sns\_topic) | terraform-aws-modules/sns/aws | 6.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_guardduty_detector.this](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/guardduty_detector) | resource |
| [aws_guardduty_filter.this](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/guardduty_filter) | resource |
| [aws_guardduty_ipset.this](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/guardduty_ipset) | resource |
| [aws_guardduty_organization_admin_account.this](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/guardduty_organization_admin_account) | resource |
| [aws_guardduty_organization_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/guardduty_organization_configuration) | resource |
| [aws_guardduty_threatintelset.this](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/guardduty_threatintelset) | resource |
| [aws_iam_policy.audit_account](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.assume_root](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.audit_account](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_object.ipset](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/s3_object) | resource |
| [aws_s3_object.threatintelset](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/s3_object) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.audit_account_policy](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.guardduty_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_audit_account_id"></a> [audit\_account\_id](#input\_audit\_account\_id) | ID of the Audit AWS Account | `string` | n/a | yes |
| <a name="input_auto_enable_organization_members"></a> [auto\_enable\_organization\_members](#input\_auto\_enable\_organization\_members) | Indicates the auto-enablement configuration of GuardDuty for the member accounts in the organization. Valid values are `ALL`, `NEW`, `NONE`. | `string` | `"NEW"` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name for the SNS topic | `string` | `"Managed by Terraform"` | no |
| <a name="input_enable_kubernetes_protection"></a> [enable\_kubernetes\_protection](#input\_enable\_kubernetes\_protection) | Configure and enable Kubernetes audit logs as a data source for Kubernetes protection. | `bool` | `true` | no |
| <a name="input_enable_malware_protection"></a> [enable\_malware\_protection](#input\_enable\_malware\_protection) | Configure and enable Malware Protection as data source for EC2 instances with findings for the detector. | `bool` | `true` | no |
| <a name="input_enable_s3_protection"></a> [enable\_s3\_protection](#input\_enable\_s3\_protection) | Configure and enable S3 protection. | `bool` | `true` | no |
| <a name="input_filter_config"></a> [filter\_config](#input\_filter\_config) | Specifies AWS GuardDuty Filter configuration.<br>  `name` - The name of the filter<br>  `rank` - Specifies the position of the filter in the list of current filters. Also specifies the order in which this filter is applied to the findings.<br>  `action` - Specifies the action that is to be applied to the findings that match the filter. Can be one of ARCHIVE or NOOP.<br>  `criterion` - Configuration block for `finding_criteria`. Composed by `field` and one or more of the following operators: `equals` \| `not_equals` \| `greater_than` \| `greater_than_or_equal` \| `less_than` \| `less_than_or_equal`. | <pre>list(object({<br>    name        = string<br>    description = string<br>    rank        = number<br>    action      = string<br>    criterion = list(object({<br>      field                 = string<br>      equals                = list(string)<br>      not_equals            = list(string)<br>      greater_than          = string<br>      greater_than_or_equal = string<br>      less_than             = string<br>      less_than_or_equal    = string<br>    }))<br>  }))</pre> | `null` | no |
| <a name="input_finding_publishing_frequency"></a> [finding\_publishing\_frequency](#input\_finding\_publishing\_frequency) | Specifies the frequency of notifications sent for subsequent finding occurrences. If the detector is a GuardDuty member account, the value is determined by the GuardDuty primary account and cannot be modified. For standalone and GuardDuty primary accounts, it must be configured in Terraform to enable drift detection. Valid values for standalone and primary accounts: `FIFTEEN_MINUTES`, `ONE_HOUR`, `SIX_HOURS`. Defaults to `SIX_HOURS`. | `string` | `"FIFTEEN_MINUTES"` | no |
| <a name="input_ipset_config"></a> [ipset\_config](#input\_ipset\_config) | Specifies AWS GuardDuty IPSet configuration.<br>  `activate` - Specifies whether GuardDuty is to start using the uploaded IPSet.<br>  `name` - The friendly name to identify the IPSet.<br>  `format` - The format of the file that contains the IPSet. Valid values: `TXT` \| `STIX` \| `OTX_CSV` \| `ALIEN_VAULT` \| `PROOF_POINT` \| `FIRE_EYE`.<br>  `content`- Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text. Example: `10.0.0.0/8\n`.<br>  `key` - Name of the object once it is in the bucket. | <pre>list(object({<br>    activate = bool<br>    name     = string<br>    format   = string<br>    content  = string<br>    key      = string<br>  }))</pre> | `null` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Name of the AWS Organization | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the service | `string` | n/a | yes |
| <a name="input_sns_create_topic"></a> [sns\_create\_topic](#input\_sns\_create\_topic) | Whether to create the SNS topic | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for AWS resources | `map(string)` | <pre>{<br>  "Service": "GuardDuty"<br>}</pre> | no |
| <a name="input_threatintelset_config"></a> [threatintelset\_config](#input\_threatintelset\_config) | Specifies AWS GuardDuty ThreatIntelSet configuration.<br>  `activate` - Specifies whether GuardDuty is to start using the uploaded ThreatIntelSet.<br>  `name` - The friendly name to identify the ThreatIntelSet.<br>  `format` - The format of the file that contains the ThreatIntelSet. Valid values: `TXT` \| `STIX` \| `OTX_CSV` \| `ALIEN_VAULT` \| `PROOF_POINT` \| `FIRE_EYE`.<br>  `content`- Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text. Example: `10.0.0.0/8\n`.<br>  `key` - Name of the object once it is in the bucket.<br>  `object_acl`- Canned ACL to apply to the object. Valid values are `private` \| `public-read` \| `public-read-write` \| `aws-exec-read` \| `authenticated-read` \| `bucket-owner-read` \| `bucket-owner-full-control`. | <pre>list(object({<br>    activate   = bool<br>    name       = string<br>    format     = string<br>    content    = string<br>    key        = string<br>    object_acl = string<br>  }))</pre> | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
