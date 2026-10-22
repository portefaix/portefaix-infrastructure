# How to bootstrap the Scaleway cloud provider

Bootstrap (or update) the root Scaleway organization infrastructure
(`terraform/scaleway/root`) and its Spacelift stacks for the `main`
environment, starting from a brand new Organization where nothing has any
IAM permission yet.

## Prerequisites

- `make check` passes (terraform, tfenv, inspec, ansible installed)
- `scw` CLI installed (`brew install scaleway/tap/scw`)
- `backend-vars/main.tfvars` and `tfvars/main.tfvars` present under
  `terraform/scaleway/spacelift/` and `terraform/scaleway/root/`

## Why this isn't a single `terraform apply`

A fresh Scaleway Organization starts with **zero IAM permissions** for
every principal except the Organization Owner — nothing can grant itself
the right to create a Project, an IAM policy, or a billing budget. Steps 1-2
below exist only to get a dedicated Terraform identity off the ground; once
that identity holds a policy, everything after it is ordinary
`make terraform-apply`.

## Steps

### 1. Authenticate as the Organization Owner

```bash
scw login
```

Confirm you are actually the Owner (not just a member/admin) before
continuing — only the Owner bypasses IAM checks:

```bash
scw account organization list   # note the Organization ID
```

Check **console.scaleway.com → Organization → Members** and confirm your
account is tagged "Owner". If it isn't, ask whoever is to run step 2 for
you, or have them generate you an Owner-scoped API key.

### 2. Create the `terraform-root` IAM application, policy and key

This is the identity Terraform will use for every `terraform apply` on
`terraform/scaleway/root`. It only needs to manage Projects, IAM and
Billing — nothing else, since `root` doesn't touch any product resource
directly.

```bash
ORGANIZATION_ID=<from step 1>

scw iam application create name=terraform-root \
  description="Applies terraform/scaleway/root (Projects, IAM, Billing)"
# note the returned ID as APPLICATION_ID

scw iam policy create name=terraform-root-policy \
  application-id=<APPLICATION_ID> \
  rules.0.organization-id=${ORGANIZATION_ID} \
  rules.0.permission-set-names.0=ProjectManager \
  rules.0.permission-set-names.1=IAMManager \
  rules.0.permission-set-names.2=BillingManager

scw account project create name=portefaix-mgmt \
  description="Portefaix management project: Terraform state, bootstrap IAM"
# note the returned PROJECT_ID

scw object bucket create portefaix-tfstates \
  project-id=<PROJECT_ID> \
  region=fr-par \
  enable-versioning=true \
  acl=private

scw iam policy create name=terraform-root-storage-policy \
  application-id=<APPLICATION_ID> \
  rules.0.project-ids.0=<PROJECT_ID> \
  rules.0.permission-set-names.0=ObjectStorageFullAccess

scw iam api-key create application-id=<APPLICATION_ID> \
  description="terraform-root" \
  default-project-id=<PROJECT_ID>
# secret_key is shown ONCE — save it now
```

`backend-vars/main.tfvars` under `terraform/scaleway/root/` and
`terraform/scaleway/spacelift/` already point at bucket
`portefaix-tfstates` — if you name it something else, update both.

**`default-project-id` on the key is not optional.** Scaleway's S3-compatible
API resolves which Project a request acts as purely from the calling key's
`default-project-id` — this governs Object Storage access independently of
IAM policies, and even the Organization Owner's own key gets `403 Forbidden`
against a bucket outside that key's default Project. Create the key with
`default-project-id` set *after* creating the Project, in the same
invocation as above — don't create the key first and add this later, it
means recreating it.

Export it for Terraform:

```bash
export SCW_ACCESS_KEY=<access_key from above>
export SCW_SECRET_KEY=<secret_key from above>
export SCW_DEFAULT_ORGANIZATION_ID=${ORGANIZATION_ID}
```

From here on, keep using `scw login`/your Owner session only for
Console-side troubleshooting — every `terraform apply` below runs as
`terraform-root`.

### 3. Bootstrap the Spacelift stacks for Scaleway

```bash
make terraform-plan SERVICE=terraform/scaleway/spacelift ENV=main
make terraform-apply SERVICE=terraform/scaleway/spacelift ENV=main
```

Creates the Spacelift space/contexts/stacks that will later manage the
product stacks (`terraform/scaleway/vpc/*`, and anything added after).

### 4. Plan and apply the root landing zone

```bash
make terraform-plan SERVICE=terraform/scaleway/root ENV=main
```

Runs `tofu init -upgrade -reconfigure -backend-config=backend-vars/main.tfvars`
then `tofu plan -var-file=tfvars/main.tfvars`. Review the plan — it creates
the `dev`/`staging`/`prod`/`network` Projects, the `administrators` IAM
group, the `spacelift` IAM application + policy (`AllProductsFullAccess`,
scoped to every Project), and — only if `budget_alert_thresholds` is
non-empty in `tfvars/main.tfvars` — the organization billing budget and its
alerts. Scaleway allows only one budget per Organization; leave
`budget_alert_thresholds = []` if one already exists outside Terraform.

```bash
make terraform-apply SERVICE=terraform/scaleway/root ENV=main
```

### 5. Create the `spacelift` application's API key

`root` created the `spacelift` IAM application but not an API key for it
(Terraform can create the application, but the key's secret is only
retrievable once, at creation time, so it's deliberately a manual step).

```bash
cd terraform/scaleway/root
SPACELIFT_APP_ID=$(terraform output -raw spacelift_application_id)
cd -

scw iam api-key create application-id=${SPACELIFT_APP_ID} \
  description="spacelift robot" \
  default-project-id=<PROJECT_ID from step 2>
# secret_key is shown ONCE — save it now
```

The `default-project-id` quirk from step 2 is specific to Object Storage's
S3-compatible API, not Scaleway's native product APIs (VPC, Kapsule, IAM,
...) which take an explicit `project_id` per resource regardless of the
key's default — so this only matters once Spacelift manages a stack that
touches Object Storage directly.

Register this access/secret key pair as the `scw_access_key`/
`scw_secret_key` Spacelift context variables (see
`terraform/scaleway/spacelift/variables.tf`) so Spacelift can apply
`terraform/scaleway/vpc/*` (hub, dev, staging, prod) and future product
stacks (Cockpit, Kafka, Queues, ...) on its own — `AllProductsFullAccess`
already covers every current and future Scaleway product, so no further
policy changes are needed when adding a new product stack.

## Troubleshooting

- `scaleway-sdk-go: insufficient permissions: ...` at any step in 1-2 means
  the session isn't actually the Organization Owner. See step 1.
- `scaleway-sdk-go: insufficient permissions: write billing_budgets` during
  step 4 means the `terraform-root` policy from step 2 is missing or wasn't
  applied — billing is Organization-scoped and needs `BillingManager`
  specifically; `AllProductsFullAccess` on Project IDs does not grant it.
- `Error refreshing state: ... HeadObject ... 403 Forbidden` during any
  `terraform-init`/`terraform-plan`/`terraform-apply`, where the IAM policy
  and bucket both check out — **check the key's `default-project-id` first**
  (`scw iam api-key get $SCW_ACCESS_KEY`). Object Storage authorization is
  gated by this field independently of IAM policy and even of Organization
  Owner status: an Owner-bound key with no matching `default-project-id`
  still gets `403` against a bucket in a different Project. This was the
  actual cause the one time this error showed up despite a verified-correct
  `ObjectStorageFullAccess` policy on the right Project. Secondary checks,
  roughly in order of likelihood if the above doesn't explain it:
  - the policy from step 2 is missing or was never actually applied — the
    `ObjectStorageFullAccess` rule, specifically, is Project-scoped, so
    check it's there with `scw iam policy list application-ids.0=<APPLICATION_ID> -o json`
    and inspect `.rules` directly, not just the summary counts (`NbRules`
    shown right after `scw iam policy create` can read `0` even when the
    rule was in fact attached — it's a display quirk, not ground truth)
  - the key in `SCW_ACCESS_KEY` isn't actually `terraform-root`'s key at all
    — if it's loaded from a secrets manager (Infisical, Vault, ...), confirm
    that secret holds `terraform-root`'s current key, not a stale one
  - a restrictive bucket policy is overriding the IAM grant:
    `scw object bucket-policy get <bucket> region=fr-par`
  - `scw iam policy create`'s dotted-path rule arguments
    (`rules.{index}.project-ids.{index}=...`) use indexed, singular names;
    confirm against `scw iam policy create --help` for your installed `scw`
    version rather than assuming — `scw iam policy list` uses the plural,
    differently-shaped `application-ids.{index}` for the same concept, so
    don't assume argument names are consistent across subcommands.
- `No valid credential sources found` / `no EC2 IMDS role found` means
  `AWS_ACCESS_KEY_ID`/`AWS_SECRET_ACCESS_KEY` aren't set in the shell running
  `terraform`/`tofu` — `scw login` does **not** set them. The S3 backend only
  reads the AWS SDK's own env vars, separate from `SCW_ACCESS_KEY`/
  `SCW_SECRET_KEY` (which only feed the `scaleway` provider block).
