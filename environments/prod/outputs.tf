output "vpc_id" {
  value = module.infrastructure.vpc_id
}

output "private_subnet_ids" {
  value = module.infrastructure.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.infrastructure.public_subnet_ids
}

output "cluster_role_arn" {
  value = module.infrastructure.cluster_role_arn
}

output "node_role_arn" {
  value = module.infrastructure.node_role_arn
}
