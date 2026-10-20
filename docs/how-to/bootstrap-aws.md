# How to bootstrap the AWS cloud provider

Bootstrap (or update) the root AWS organization infrastructure (`terraform/aws/root`) for the
`main` environment.

## Prerequisites

- `make check` passes (terraform, tfenv, inspec, ansible installed)
- AWS credentials for the target account exported in your shell
- `backend-vars/main.tfvars` and `tfvars/main.tfvars` present under `terraform/aws/root/`

## Steps

1. Bootstrap the Spacelift stacks/spaces for AWS (`terraform/aws/spacelift`):

   ```bash
   make terraform-plan SERVICE=terraform/aws/spacelift ENV=main
   make terraform-apply SERVICE=terraform/aws/spacelift ENV=main
   ```

   Creates the Spacelift spaces/contexts/stacks that will manage the rest of the AWS
   infrastructure (including `portefaix-aws-orga-config` and the root org stack below).

2. Plan the root org changes:

   ```bash
   make terraform-plan SERVICE=terraform/aws/root ENV=main
   ```

   Runs `terraform init -upgrade -reconfigure -backend-config=backend-vars/main.tfvars`
   then `terraform plan -var-file=tfvars/main.tfvars`. Review the plan output before continuing.

3. Apply the changes:

   ```bash
   make terraform-apply SERVICE=terraform/aws/root ENV=main
   ```

   Re-inits then runs `terraform apply -var-file=tfvars/main.tfvars`.
