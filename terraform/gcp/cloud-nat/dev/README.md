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

| Name                                                            | Source               | Version |
| --------------------------------------------------------------- | -------------------- | ------- |
| <a name="module_cloud_nat"></a> [cloud\_nat](#module_cloud_nat) | ../modules/cloud-nat | n/a     |

## Resources

| Name                                                                                                                                      | Type        |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [google_compute_address.external_ip_0](https://registry.terraform.io/providers/hashicorp/google/4.84.0/docs/data-sources/compute_address) | data source |
| [google_compute_address.external_ip_1](https://registry.terraform.io/providers/hashicorp/google/4.84.0/docs/data-sources/compute_address) | data source |

## Inputs

| Name                                                                                                    | Description                                                    | Type     | Default | Required |
| ------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- | -------- | ------- | :------: |
| <a name="input_min_ports_per_vm"></a> [min\_ports\_per\_vm](#input_min_ports_per_vm)                    | Minimum number of ports allocated to a VM from this NAT config | `number` | n/a     |   yes    |
| <a name="input_nat_external_ip_0_name"></a> [nat\_external\_ip\_0\_name](#input_nat_external_ip_0_name) | Name of the first External IP to use                           | `string` | n/a     |   yes    |
| <a name="input_nat_external_ip_1_name"></a> [nat\_external\_ip\_1\_name](#input_nat_external_ip_1_name) | Name of the second External IP to use                          | `string` | n/a     |   yes    |
| <a name="input_nat_name"></a> [nat\_name](#input_nat_name)                                              | Name of the Cloud NAT                                          | `string` | n/a     |   yes    |
| <a name="input_nat_network"></a> [nat\_network](#input_nat_network)                                     | Name of the network                                            | `string` | n/a     |   yes    |
| <a name="input_nat_router_name"></a> [nat\_router\_name](#input_nat_router_name)                        | The name of the router in which this NAT will be configured    | `string` | n/a     |   yes    |
| <a name="input_project"></a> [project](#input_project)                                                  | The project in which the resource belongs                      | `string` | n/a     |   yes    |
| <a name="input_region"></a> [region](#input_region)                                                     | The location linked to the project                             | `string` | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
