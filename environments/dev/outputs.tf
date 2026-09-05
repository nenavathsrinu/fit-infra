output "vpc_id" {
  description = "VPC ID for the EKS environment."
  value       = module.infrastructure.vpc_id
}

output "private_subnet_ids" {
  description = "Private subnet IDs for EKS."
  value       = module.infrastructure.private_subnet_ids
}

output "public_subnet_ids" {
  description = "Public subnet IDs for load balancers."
  value       = module.infrastructure.public_subnet_ids
}

output "cluster_role_arn" {
  description = "EKS control plane role ARN for fit-eks."
  value       = module.infrastructure.cluster_role_arn
}

output "node_role_arn" {
  description = "EKS node role ARN for fit-eks."
  value       = module.infrastructure.node_role_arn
}

output "tf_state_bucket_name" {
  description = "Terraform state S3 bucket name."
  value       = module.infrastructure.tf_state_bucket_name
}

output "tf_state_lock_table_name" {
  description = "Terraform lock DynamoDB table name."
  value       = module.infrastructure.tf_state_lock_table_name
}
