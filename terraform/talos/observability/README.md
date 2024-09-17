## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | 5.17.0   |

## Providers

| Name                                                                                        | Version |
| ------------------------------------------------------------------------------------------- | ------- |
| <a name="provider_aws.cloudflare_r2"></a> [aws.cloudflare\_r2](#provider_aws.cloudflare_r2) | 5.17.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                 | Type     |
| -------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_s3_bucket.observability](https://registry.terraform.io/providers/hashicorp/aws/5.17.0/docs/resources/s3_bucket) | resource |

## Inputs

| Name                                                                                               | Description               | Type           | Default | Required |
| -------------------------------------------------------------------------------------------------- | ------------------------- | -------------- | ------- | :------: |
| <a name="input_buckets"></a> [buckets](#input_buckets)                                             | List of buckets names     | `list(string)` | n/a     |   yes    |
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input_cloudflare_account_id) | The Cloudflare account ID | `string`       | n/a     |   yes    |

## Outputs

No outputs.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.66.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 4.41.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.cloudflare_r2"></a> [aws.cloudflare\_r2](#provider\_aws.cloudflare\_r2) | 5.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.observability](https://registry.terraform.io/providers/hashicorp/aws/5.66.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.life_cycles](https://registry.terraform.io/providers/hashicorp/aws/5.66.0/docs/resources/s3_bucket_lifecycle_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_buckets"></a> [buckets](#input\_buckets) | List of buckets names | <pre>map(object({<br>    days = number<br>  }))</pre> | n/a | yes |
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | The Cloudflare account ID | `string` | n/a | yes |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | The Cloudflare API token | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
