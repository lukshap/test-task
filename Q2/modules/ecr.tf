resource "aws_ecr_repository" "this" {
  count = var.ecr_count
  name = format("ecr-%s-test-tasks", count.index)

  tags = merge({Name=format("ECR-%s-test-tasks", count.index)},var.tags)
}

resource "aws_ecr_lifecycle_policy" "this" {
  count = var.ecr_count
  repository = aws_ecr_repository.this[count.index].name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Remove images older than 60 days",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 60
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 2,
      "description": "Remain 20 last images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 20
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}