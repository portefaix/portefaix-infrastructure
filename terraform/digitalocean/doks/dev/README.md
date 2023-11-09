## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                              | Version  |
| --------------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)          | >= 1.0.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement_digitalocean) | 2.27.1   |

## Providers

No providers.

## Modules

| Name                                            | Source          | Version |
| ----------------------------------------------- | --------------- | ------- |
| <a name="module_doks"></a> [doks](#module_doks) | ../modules/doks | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                                        | Description                                                                                     | Type                                                                                                                                                                                                     | Default                                       | Required |
| --------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------- | :------: |
| <a name="input_auto_scale"></a> [auto\_scale](#input_auto_scale)                                                            | Enable cluster autoscaling                                                                      | `bool`                                                                                                                                                                                                   | n/a                                           |   yes    |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input_auto_upgrade)                                                      | Whether the cluster will be automatically upgraded                                              | `bool`                                                                                                                                                                                                   | n/a                                           |   yes    |
| <a name="input_cluster_name"></a> [cluster\_name](#input_cluster_name)                                                      | Cluster name                                                                                    | `string`                                                                                                                                                                                                 | n/a                                           |   yes    |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input_kubernetes_version)                                    | The EKS Kubernetes version                                                                      | `string`                                                                                                                                                                                                 | n/a                                           |   yes    |
| <a name="input_maintenance_policy_day"></a> [maintenance\_policy\_day](#input_maintenance_policy_day)                       | The day of the maintenance window policy                                                        | `string`                                                                                                                                                                                                 | n/a                                           |   yes    |
| <a name="input_maintenance_policy_start_time"></a> [maintenance\_policy\_start\_time](#input_maintenance_policy_start_time) | The start time in UTC of the maintenance window policy in 24-hour clock format / HH:MM notation | `string`                                                                                                                                                                                                 | n/a                                           |   yes    |
| <a name="input_max_nodes"></a> [max\_nodes](#input_max_nodes)                                                               | Autoscaling maximum node capacity                                                               | `string`                                                                                                                                                                                                 | `5`                                           |    no    |
| <a name="input_min_nodes"></a> [min\_nodes](#input_min_nodes)                                                               | Autoscaling Minimum node capacity                                                               | `string`                                                                                                                                                                                                 | `1`                                           |    no    |
| <a name="input_node_count"></a> [node\_count](#input_node_count)                                                            | The number of Droplet instances in the node pool.                                               | `number`                                                                                                                                                                                                 | n/a                                           |   yes    |
| <a name="input_node_labels"></a> [node\_labels](#input_node_labels)                                                         | List of Kubernetes labels to apply to the nodes                                                 | `map(any)`                                                                                                                                                                                               | <pre>{<br> "service": "kubernetes"<br>}</pre> |    no    |
| <a name="input_node_pools"></a> [node\_pools](#input_node_pools)                                                            | Addons node pools                                                                               | <pre>map(object({<br> size = string<br> node_count = number<br> auto_scale = bool<br> min_nodes = number<br> max_nodes = number<br> node_tags = list(string)<br> node_labels = map(string)<br> }))</pre> | `{}`                                          |    no    |
| <a name="input_node_tags"></a> [node\_tags](#input_node_tags)                                                               | The list of instance tags applied to all nodes.                                                 | `list(any)`                                                                                                                                                                                              | <pre>[<br> "kubernetes"<br>]</pre>            |    no    |
| <a name="input_region"></a> [region](#input_region)                                                                         | The location of the cluster                                                                     | `string`                                                                                                                                                                                                 | n/a                                           |   yes    |
| <a name="input_size"></a> [size](#input_size)                                                                               | The slug identifier for the type of Droplet to be used as workers in the node pool.             | `string`                                                                                                                                                                                                 | n/a                                           |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                               | The list of instance tags applied to the cluster.                                               | `list(any)`                                                                                                                                                                                              | <pre>[<br> "kubernetes"<br>]</pre>            |    no    |
| <a name="input_vpc_name"></a> [vpc\_name](#input_vpc_name)                                                                  | VPC name                                                                                        | `string`                                                                                                                                                                                                 | n/a                                           |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
