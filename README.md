# FitEks shared infrastructure

This repository owns shared AWS infrastructure used by `fit-eks` and `fiteks-api`.

## Layout

```text
modules/vpc.tf           VPC, subnets, NAT, and route tables
modules/s3.tf            Terraform state S3 bucket
modules/dynamodb.tf      Terraform state lock table
modules/iam.tf           EKS control plane and node IAM roles
environments/dev/        Development composition and inputs
```

## Bootstrap

The state bootstrap environment uses local state because an S3 backend cannot create its own bucket before initialization.

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

The S3 bucket and DynamoDB table outputs are used when configuring remote backends in the other repositories.
