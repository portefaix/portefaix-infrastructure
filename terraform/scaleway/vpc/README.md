# Scaleway VPC - Hub and Spoke Network

Hub-and-spoke network for the Portefaix Scaleway footprint, split into four
independent Spacelift-managed stacks sharing the [`modules/vpc`](modules/vpc)
module:

| Stack      | Project (from `terraform/scaleway/root`) | Role                                               |
| ---------- | ----------------------------------------- | --------------------------------------------------- |
| `hub`      | `network_project_id`                      | Hub VPC: transit / shared-services / management     |
| `dev`      | `project_ids.dev`                         | Spoke VPC, connected to the hub                      |
| `staging`  | `project_ids.staging`                     | Spoke VPC, connected to the hub                      |
| `prod`     | `project_ids.prod`                        | Spoke VPC, connected to the hub                      |

```
                       ┌─────────────────────────┐
                       │   hub VPC (network)      │
                       │  transit / shared-svc /  │
                       │      management          │
                       │   (+ Public Gateway)     │
                       └────────────┬─────────────┘
                 connector ┌────────┼────────┐ connector
                           │        │         │
                      ┌────▼───┐┌───▼────┐┌───▼────┐
                      │  dev   ││staging ││  prod  │
                      │  VPC   ││  VPC   ││  VPC   │
                      └────────┘└────────┘└────────┘
                         (ACL denies dev<->staging<->prod directly)
```

## Wiring order

1. Apply `terraform/scaleway/root` first — it creates the `dev`/`staging`/
   `prod`/`network` Projects.
2. Apply `hub/` — copy its `vpc_id` output into each spoke's
   `hub_vpc_id` tfvar.
3. Apply `dev/`, `staging/`, `prod/` — each needs its own `project_id`
   copied from root's `project_ids` output.

Cross-stack values are copied by hand into each stack's `*.auto.tfvars`
(marked `# TODO`), matching the convention already used by the other
Scaleway Spacelift stacks (e.g. `kapsule` takes `private_network_name` as a
plain variable) rather than `terraform_remote_state`.

## Isolation

Each spoke stack's `deny_cidrs` tfvar lists its sibling spokes' subnet
CIDRs; the module turns that into a `scaleway_vpc_acl` that drops traffic
to/from them, so `dev`, `staging` and `prod` can only reach each other by
routing through the hub. Set `create_acl = false` to disable.

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |
| scaleway  | 2.87.0   |

Pinned to `2.87.0` — `scaleway_vpc_connector` and `scaleway_vpc_acl` don't
exist in the `2.60.4` pin used by the other Scaleway stacks in this repo.
