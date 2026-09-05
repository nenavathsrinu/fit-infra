output "vpc_id" {
  description = "VPC ID for the EKS environment."
  value       = aws_vpc.this.id
}

output "private_subnet_ids" {
  description = "Private subnet IDs for EKS."
  value       = aws_subnet.private[*].id
}

output "public_subnet_ids" {
  description = "Public subnet IDs for load balancers."
  value       = aws_subnet.public[*].id
}

output "cluster_role_arn" {
  description = "EKS control plane role ARN for fit-eks."
  value       = aws_iam_role.cluster.arn
}

output "node_role_arn" {
  description = "EKS node role ARN for fit-eks."
  value       = aws_iam_role.nodes.arn
}

output "tf_state_bucket_name" {
  description = "Terraform state S3 bucket name."
  value       = aws_s3_bucket.state.bucket
}

output "tf_state_lock_table_name" {
  description = "Terraform lock DynamoDB table name."
  value       = aws_dynamodb_table.lock.name
}
