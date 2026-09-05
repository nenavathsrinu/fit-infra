terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "infrastructure" {
  source = "../../modules"

  aws_region               = var.aws_region
  cluster_name             = var.cluster_name
  network_name             = var.network_name
  vpc_cidr                 = var.vpc_cidr
  az_count                 = var.az_count
  tf_state_bucket_name     = var.tf_state_bucket_name
  tf_state_lock_table_name = var.tf_state_lock_table_name
  tags                     = var.tags
}
