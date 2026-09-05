terraform {
  # Pin Terraform and the AWS provider versions used by this environment.
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Keep all devint-specific values in this environment entry point.
locals {
  aws_region   = "us-east-1"
  cluster_name = "fiteks-devint"
  network_name = "fiteks-devint"
  vpc_cidr     = "10.1.0.0/16"
  az_count     = 2
  tags = {
    Project     = "fiteks"
    Environment = "devint"
  }
}

# Use the devint AWS account and region for all resources in this stack.
provider "aws" {
  region = local.aws_region
}

# Reuse the shared VPC and IAM infrastructure module for devint.
module "infrastructure" {
  source = "../../modules"

  aws_region   = local.aws_region
  cluster_name = local.cluster_name
  network_name = local.network_name
  vpc_cidr     = local.vpc_cidr
  az_count     = local.az_count
  tags         = local.tags
}
