resource "aws_ecr_repository" "simble_be" {
  name                 = var.repository_name
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }
}

resource "aws_ecr_lifecycle_policy" "example" {
  repository = aws_ecr_repository.simble_be.name

  policy = templatefile(var.life_cycle_policy, {})
}
