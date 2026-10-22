# Talos Homelab - Foundation

Shared foundation for the Portefaix Talos homelab stacks: looks up the
Cloudflare zone used across the homelab and exposes its id so other
stacks don't each hardcode it.

Other Talos stacks ([`terraform/talos/waf`](../waf),
[`terraform/talos/zero-trust`](../zero-trust)) consume the zone id
produced here through a Spacelift stack dependency reference (see
[`terraform/talos/spacelift`](../spacelift)), not Terraform remote state:
this stack's state is Spacelift-managed, like every other Talos stack.

## Notes

- Cloudflare has a single, flat account for the homelab — there is no
  accounts/projects split to manage here, unlike `aws/root` or
  `scaleway/root`. This stack is intentionally thin.
- `cloudflare_account_id` and `CLOUDFLARE_API_TOKEN` are still injected
  into every stack directly via the shared `spacelift_context` (see
  `terraform/talos/spacelift/contexts.tf`); they're constants, not
  computed values, so outputting them from here would add nothing.
- Follow-ups, not done here:
  - Once the `portefaix-homelab-root` stack has applied and the
    `spacelift_stack_dependency_reference` confirmed working, drop the
    now-redundant `cloudflare_zone_id` environment variable from
    `contexts.tf` so there's a single source of truth.
  - A scoped `cloudflare_api_token` (replacing the manually-pasted,
    account-wide token in the Spacelift context) would be the real
    Talos analog of `scaleway/root`'s IAM resources, but it has a
    bootstrap problem (needs an initial token to create itself) and
    isn't done here.
  - The zone itself is not imported as a managed resource; doing so is
    an ownership decision (who's allowed to destroy it) left for later.
