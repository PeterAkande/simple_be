resource "aws_db_instance" "postgres" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "15.7"
  instance_class         = "db.t3.micro"
  identifier             = "appdb"
  username               = "postgres"
  password               = var.db_password
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.ecs_sg.id]
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.main.id # Specify subnet group
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  port                 = 6379
  security_group_ids   = [aws_security_group.ecs_sg.id]
  subnet_group_name    = aws_elasticache_subnet_group.main.id # Specify subnet group
}

resource "aws_db_subnet_group" "main" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.public_subnet_2.id] # Specify your subnets here
  tags = {
    Name = "My DB Subnet Group"
  }
}

resource "aws_elasticache_subnet_group" "main" {
  name       = "my-elasticache-subnet-group"
  subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.public_subnet_2.id] # Specify your subnets here

  tags = {
    Name = "My ElastiCache Subnet Group"
  }
}
