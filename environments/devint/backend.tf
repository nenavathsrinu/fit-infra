terraform {
  backend "s3" {
    bucket         = "REPLACE_WITH_TERRAFORM_STATE_BUCKET"
    key            = "fit-infra/devint/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "REPLACE_WITH_TERRAFORM_LOCK_TABLE"
    encrypt        = true
  }
}
