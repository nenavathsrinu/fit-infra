terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

locals {
  aws_region               = "us-east-1"
  cluster_name             = "fiteks-prod"
  network_name             = "fiteks-prod"
  vpc_cidr                 = "10.2.0.0/16"
  az_count                 = 2
  tf_state_bucket_name     = "REPLACE_WITH_TERRAFORM_STATE_BUCKET"
  tf_state_lock_table_name = "REPLACE_WITH_TERRAFORM_LOCK_TABLE"
  tags = {
    Project     = "fiteks"
    Environment = "prod"
  }
}

provider "aws" {
  region = local.aws_region
}

module "infrastructure" {
  source = "../../modules"

  aws_region               = local.aws_region
  cluster_name             = local.cluster_name
  network_name             = local.network_name
  vpc_cidr                 = local.vpc_cidr
  az_count                 = local.az_count
  tf_state_bucket_name     = local.tf_state_bucket_name
  tf_state_lock_table_name = local.tf_state_lock_table_name
  tags                     = local.tags
}
