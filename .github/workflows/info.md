# Infrastructure CI/CD

## CI

`ci.yaml` runs Terraform formatting and validates `dev`, `devint`, and `prod` on pull requests and pushes to `main`.

## Deployment flow

- Manually run `feature.yaml` from a `feature-*` branch to deploy only `dev`.
- Merge a release pull request into a `release-*` branch to automatically run `release.yaml` and deploy `devint`.
- Manually run `deploy.yaml` for production.
- Manually run `destroy.yaml`, select an environment, and type `DESTROY` for destructive cleanup.

The `destroy.yaml` workflow is intentionally separate from deployment workflows. It requires the same AWS OIDC role and state variables for the selected environment.

## Bootstrap

`bootstrap-dev.yaml` is a manual, one-time workflow for creating the initial VPC, S3 state bucket, DynamoDB lock table, and IAM roles.

Required `dev` environment secret:

- `AWS_DEPLOY_ROLE_ARN`

Add `AWS_DEPLOY_ROLE_ARN` separately to both the `dev` and `devint` GitHub environments. The value must be the ARN of an IAM role that trusts the repository's GitHub OIDC subject and allows the required AWS actions.

The deploy role must trust GitHub Actions OIDC and allow the shared infrastructure resources to be created.

Environment-specific Terraform values are defined directly in each environment's `main.tf`. Workflow environment variables provide `AWS_REGION`, `TF_STATE_BUCKET_NAME`, and `TF_STATE_LOCK_TABLE_NAME` for AWS and remote state initialization.

The S3 state bucket and DynamoDB lock table must exist before running `feature.yaml` or `deploy.yaml`. Do not use local state for routine CI/CD because GitHub-hosted runners are ephemeral.

## Branch rules

- `feature-*` branches run `feature.yaml` and apply both `dev` and `devint`.
- `deploy.yaml` is manual and applies only `prod`.
