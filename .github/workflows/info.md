# Infrastructure CI/CD

## CI

`ci.yaml` runs Terraform formatting and validates `dev`, `devint`, and `prod` on pull requests and pushes to `main`.

## Bootstrap

`bootstrap-dev.yaml` is a manual, one-time workflow for creating the initial VPC, S3 state bucket, DynamoDB lock table, and IAM roles.

Required `dev` environment variables:

- `AWS_REGION`
- `CLUSTER_NAME`
- `NETWORK_NAME`
- `TF_STATE_BUCKET_NAME`
- `TF_STATE_LOCK_TABLE_NAME`

Required `dev` environment secret:

- `AWS_DEPLOY_ROLE_ARN`

The deploy role must trust GitHub Actions OIDC and allow the shared infrastructure resources to be created.

The S3 state bucket and DynamoDB lock table must exist before running `feature.yaml` or `deploy.yaml`. Do not use local state for routine CI/CD because GitHub-hosted runners are ephemeral.

## Branch rules

- `feature-*` branches run `feature.yaml` and apply both `dev` and `devint`.
- `deploy.yaml` is manual and applies only `prod`.
