# FitEks shared infrastructure

This repository owns shared AWS infrastructure used by `fit-eks` and `fiteks-api`.

## Layout

```text
modules/vpc.tf           VPC, subnets, NAT, and route tables
modules/iam.tf           EKS control plane and node IAM roles
environments/dev/        Development composition and inputs
environments/devint/     Development integration composition and inputs
environments/prod/       Production composition and inputs
```

## Bootstrap

The first state bootstrap uses local state because an S3 backend cannot create its own bucket before initialization. Run the bootstrap workflow once, then use the remote S3 state for normal CI/CD.

```bash
cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars
terraform -chdir=environments/dev init
terraform -chdir=environments/dev plan
terraform -chdir=environments/dev apply
```

After apply, record these outputs for `fit-eks`:

- `private_subnet_ids`
- `cluster_role_arn`
- `node_role_arn`

The existing S3 bucket and DynamoDB table are used as remote Terraform state. They are not managed by this repository.
- new
