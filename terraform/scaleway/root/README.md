# Scaleway Landing Zone - Organization Foundation

Organization-level foundation for the Portefaix Scaleway footprint: one
Scaleway Project per environment (`dev`, `staging`, `prod`) plus a shared
`network` Project, the IAM group/policy for administrators, the Spacelift
robot identity, and the organization billing budget and alerts.

Networking (hub-and-spoke VPCs) is a separate Spacelift-managed stack, see
[`terraform/scaleway/vpc`](../vpc); it consumes the Project IDs produced
here (`project_ids`, `network_project_id`).

Other Scaleway stacks (`kapsule`, `registry`, `observability`, `eso`, ...)
also consume the Project IDs produced here; they should not create their
own Project.

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.0.0 |
| scaleway  | 2.87.0   |

## Resources

| Name                                                                                                                                   |
| --------------------------------------------------------------------------------------------------------------------------------------- |
| [scaleway_account_project](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/account_project)             |
| [scaleway_iam_group](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/iam_group)                         |
| [scaleway_iam_application](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/iam_application)             |
| [scaleway_iam_policy](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/iam_policy)                       |
| [scaleway_billing_budget](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/billing_budget)               |
| [scaleway_billing_budget_alert](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/billing_budget_alert)   |
| [scaleway_billing_budget_alert_notification](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/billing_budget_alert_notification) |

## Notes

- Scaleway has a single, flat Organization (no folders/OUs like AWS or
  GCP); isolation between environments is done at the Project level.
- `scaleway_billing_budget` is scoped to the whole Organization, not per
  Project — there is one budget here covering every environment. Scaleway
  also only allows **one budget per Organization**, so recreating it after
  manually deleting the one Terraform manages will fail until the old one
  is gone.
- The budget (and its alerts/notifications) is only created when
  `budget_alert_thresholds` is non-empty — set it to `[]` to not have a
  budget at all (e.g. one already exists outside Terraform, or you're not
  ready to set a spend target yet).
- The `administrators` IAM group uses `external_membership = true`, so
  users/applications are attached to it with `scaleway_iam_group_membership`
  elsewhere, without touching this stack.
- Pinned to `scaleway` provider `2.87.0` — `scaleway_billing_budget*`
  doesn't exist in the `2.60.4` pin used by the other Scaleway stacks in
  this repo.
