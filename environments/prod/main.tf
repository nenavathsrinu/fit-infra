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
  aws_region   = "us-east-1"
  cluster_name = "fiteks-prod"
  network_name = "fiteks-prod"
  vpc_cidr     = "10.2.0.0/16"
  az_count     = 2
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

  aws_region   = local.aws_region
  cluster_name = local.cluster_name
  network_name = local.network_name
  vpc_cidr     = local.vpc_cidr
  az_count     = local.az_count
  tags         = local.tags
}
