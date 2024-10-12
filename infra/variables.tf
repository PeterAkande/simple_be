variable "aws_profile" {
  description = "AWS profile to use"
  type        = string

}

variable "aws_region" {
  description = "AWS region to use"
  type        = string
}

variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "life_cycle_policy" {
  description = "Lifecycle policy for ECR"
  type        = string

}

variable "postgres_username" {
  description = "Username for PostgreSQL instance"
  type        = string
  default     = "postgres" # Customize this as needed
}

variable "postgres_password" {
  description = "Password for PostgreSQL instance"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "List of subnet IDs for ElastiCache Redis"
  type        = list(string)
  default = [  ]
}


variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
}

variable "db_password" {
  description = "Database password for PostgreSQL"
  type        = string
  sensitive   = true
}
