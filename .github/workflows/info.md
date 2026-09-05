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

`bootstrap-dev.yaml` is a manual workflow for creating the initial VPC and IAM roles.

Required `dev` environment secret:

- `AWS_DEPLOY_ROLE_ARN`

Add `AWS_DEPLOY_ROLE_ARN` separately to both the `dev` and `devint` GitHub environments. The value must be the ARN of an IAM role that trusts the repository's GitHub OIDC subject and allows the required AWS actions.

The deploy role must trust GitHub Actions OIDC and allow the shared infrastructure resources to be created.

Deployment emails are sent to `alexinvi@gmail.com`. Add these secrets to each deployment environment (`dev`, `devint`, and `production`):

- `SMTP_SERVER`
- `SMTP_USERNAME`
- `SMTP_PASSWORD`
- `SMTP_FROM`

`SMTP_FROM` may be omitted; the workflow falls back to `SMTP_USERNAME` as the sender.

Environment-specific Terraform values are defined directly in each environment's `main.tf`. The existing S3 bucket and DynamoDB table are used only as the remote Terraform backend; this repository does not create or destroy them.

## Branch rules

- `feature-*` branches run `feature.yaml` and can apply or destroy `dev`.
- `release-*` branches run `release.yaml` and deploy `devint`.
- `deploy.yaml` is manual and applies only `prod`.
