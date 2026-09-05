variable "aws_region" {
  description = "AWS region for shared infrastructure."
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name used for resource names and subnet tags."
  type        = string
}

variable "network_name" {
  description = "Name prefix for VPC resources."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of availability zones."
  type        = number
  default     = 2

  validation {
    condition     = var.az_count >= 2 && var.az_count <= 3
    error_message = "az_count must be 2 or 3."
  }
}

variable "tf_state_bucket_name" {
  description = "Globally unique Terraform state bucket name."
  type        = string
}

variable "tf_state_lock_table_name" {
  description = "DynamoDB table used for Terraform state locking."
  type        = string
}

variable "tags" {
  description = "Additional resource tags."
  type        = map(string)
  default     = {}
}
