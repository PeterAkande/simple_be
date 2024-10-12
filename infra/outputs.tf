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

output "postgres_port" {
  description = "The port PostgreSQL is listening on."
  value       = aws_db_instance.postgres.port
}

output "postgres_user" {
  description = "The username for the PostgreSQL instance."
  value       = aws_db_instance.postgres.username
}

output "postgres_password" {
  description = "The password for the PostgreSQL instance."
  value       = aws_db_instance.postgres.password
  sensitive   = true # Marks the output as sensitive to hide it in logs.
}

output "redis_endpoint" {
  description = "The endpoint of the Redis instance."
  value       = aws_elasticache_cluster.redis.configuration_endpoint
}

output "redis_port" {
  description = "The port Redis is listening on."
  value       = aws_elasticache_cluster.redis.port
}
