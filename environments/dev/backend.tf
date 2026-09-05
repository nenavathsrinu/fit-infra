terraform {
  backend "s3" {
    bucket         = "REPLACE_WITH_TERRAFORM_STATE_BUCKET"
    key            = "fit-infra/dev/terraform.tfstate"
    region         = "ap-south-2"
    dynamodb_table = "REPLACE_WITH_TERRAFORM_LOCK_TABLE"
    encrypt        = true
  }
}
