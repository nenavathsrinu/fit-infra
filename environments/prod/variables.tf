variable "aws_region" {
  description = "AWS region for shared infrastructure."
  type        = string
}

variable "cluster_name" {
  description = "Name prefix for EKS IAM roles."
  type        = string
  default     = "fiteks-prod"
}

variable "network_name" {
  description = "Name prefix for VPC resources."
  type        = string
  default     = "fiteks-prod"
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC."
  type        = string
  default     = "10.2.0.0/16"
}

variable "az_count" {
  description = "Number of availability zones."
  type        = number
  default     = 2
}

variable "tf_state_bucket_name" {
  description = "Globally unique S3 bucket name for Terraform state."
  type        = string
}

variable "tf_state_lock_table_name" {
  description = "DynamoDB table name for Terraform locking."
  type        = string
}

variable "tags" {
  description = "Additional resource tags."
  type        = map(string)
  default = {
    Project     = "fiteks"
    Environment = "prod"
  }
}
