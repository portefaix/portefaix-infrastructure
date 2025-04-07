## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement_google)          | 4.84.0   |

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_google"></a> [google](#provider_google) | 4.84.0  |

## Modules

| Name                                         | Source                                    | Version |
| -------------------------------------------- | ----------------------------------------- | ------- |
| <a name="module_dns"></a> [dns](#module_dns) | terraform-google-modules/cloud-dns/google | 5.1.0   |

## Resources

| Name                                                                                                                            | Type        |
| ------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/4.84.0/docs/data-sources/compute_network) | data source |

## Inputs

| Name                                                                   | Description                               | Type          | Default                                      | Required |
| ---------------------------------------------------------------------- | ----------------------------------------- | ------------- | -------------------------------------------- | :------: |
| <a name="input_domain_name"></a> [domain\_name](#input_domain_name)    | Zone domain, must end with a period.      | `string`      | n/a                                          |   yes    |
| <a name="input_labels"></a> [labels](#input_labels)                    | Map of labels to apply to the DNS         | `map(string)` | <pre>{<br> "made-by": "terraform"<br>}</pre> |    no    |
| <a name="input_network_name"></a> [network\_name](#input_network_name) | Name of the network to use                | `string`      | n/a                                          |   yes    |
| <a name="input_project"></a> [project](#input_project)                 | The project in which the resource belongs | `string`      | n/a                                          |   yes    |
| <a name="input_region"></a> [region](#input_region)                    | The location linked to the project        | `string`      | n/a                                          |   yes    |
| <a name="input_zone_name"></a> [zone\_name](#input_zone_name)          | Zone name                                 | `string`      | n/a                                          |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
