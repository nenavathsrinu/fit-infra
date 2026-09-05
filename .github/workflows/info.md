# Infrastructure CI/CD

## CI

`ci.yaml` runs Terraform formatting, initialization without a backend, and validation on pull requests and pushes to `main`.

## Bootstrap

`bootstrap-dev.yaml` is a manual, one-time workflow for creating the initial VPC, S3 state bucket, DynamoDB lock table, and IAM roles while the environment uses local state.

Required `dev` environment variables:

- `AWS_REGION`
- `CLUSTER_NAME`
- `NETWORK_NAME`
- `TF_STATE_BUCKET_NAME`
- `TF_STATE_LOCK_TABLE_NAME`

Required `dev` environment secret:

- `AWS_DEPLOY_ROLE_ARN`

The deploy role must trust GitHub Actions OIDC and allow the shared infrastructure resources to be created.

After bootstrap, migrate `environments/dev` from local state to the S3 bucket and DynamoDB table before using `plan-dev.yaml` repeatedly. Do not use local state for routine CI/CD because GitHub-hosted runners are ephemeral.
