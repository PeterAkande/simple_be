output "aws_ecr_repo_url" {
  value = aws_ecr_repository.simble_be.repository_url
}

output "aws_ecr_repo_arn" {
  value = aws_ecr_repository.simble_be.arn
}


output "postgres_endpoint" {
  description = "PostgreSQL endpoint"
  value       = aws_db_instance.postgres.address
}

output "redis_endpoint" {
  description = "Redis endpoint"
  value       = aws_elasticache_cluster.redis.cache_nodes[0].address
}
