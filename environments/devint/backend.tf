terraform {
  backend "s3" {
    bucket         = "nenavathsrinu-fiteks-terraform-state"
    key            = "fit-infra/devint/terraform.tfstate"
    region         = "ap-south-2"
    dynamodb_table = "fiteks-terraform-locks"
    encrypt        = true
  }
}
