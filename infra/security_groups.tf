// Load balancer security group
resource "aws_security_group" "load_balancer_sg" {
  name        = "load_balancer_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.app_vpc.id

}

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.load_balancer_sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
# }

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_port80" {
  security_group_id = aws_security_group.load_balancer_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_in_ipv4" {
  security_group_id = aws_security_group.load_balancer_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

// ecs
resource "aws_security_group" "ecs_instances_sg" {
  name        = "ecs_instances_sg"
  description = "ECS Instances SG"
  vpc_id      = aws_vpc.app_vpc.id

}

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.ecs_instances_sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }


resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_ec2" {
  security_group_id = aws_security_group.ecs_instances_sg.id
  from_port         = 0
  ip_protocol       = "tcp"
  to_port           = 8000

  referenced_security_group_id = aws_security_group.load_balancer_sg.id
}



resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4_sg" {
  security_group_id            = aws_security_group.ecs_instances_sg.id
  referenced_security_group_id = aws_security_group.load_balancer_sg.id
  ip_protocol                  = "-1" # semantically equivalent to all ports
}



// Rds
resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "RDS SG"
  vpc_id      = aws_vpc.app_vpc.id

}

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_rds" {
#   security_group_id = aws_security_group.ecs_instances_sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }


resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_rds" {
  security_group_id = aws_security_group.rds_sg.id
  from_port         = 5432
  ip_protocol       = "tcp"
  to_port           = 5432

  # referenced_security_group_id = aws_security_group.ecs_instances_sg.id
}


// ElastiCache
resource "aws_security_group" "elasticache_sg" {
  name        = "elasticache_sg"
  description = "ElastiCache SG"
  vpc_id      = aws_vpc.app_vpc.id

}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_elasticache" {
  security_group_id = aws_security_group.elasticache_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_elasticache" {
  security_group_id = aws_security_group.elasticache_sg.id
  from_port         = 6379
  ip_protocol       = "tcp"
  to_port           = 6379

  # referenced_security_group_id = aws_security_group.ecs_instances_sg.id
}
