## IAM for ecs ec2 machines
data "aws_iam_policy_document" "ecs_ec2_instance" {
  statement {
      actions = ["sts:AssumeRole"]

      principals {
          type        = "Service"
          identifiers = ["ec2.amazonaws.com"]
      }
  }
}

resource "aws_iam_role" "ecs_ec2_instance" {
  name                = "ECS_EC2-instance-role"
  path                = "/"
  assume_role_policy  = data.aws_iam_policy_document.ecs_ec2_instance.json
}

resource "aws_iam_role_policy_attachment" "ecs_for_ec2_policy" {
  role       = aws_iam_role.ecs_ec2_instance.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_ec2_instance" {
  name = "ECS-EC2-test-task"
  role = aws_iam_role.ecs_ec2_instance.name
}

## IAM for ecs services
data "aws_iam_policy_document" "ecs_service" {
  statement {
      actions = ["sts:AssumeRole"]

      principals {
          type        = "Service"
          identifiers = ["ecs.amazonaws.com"]
      }
  }
}

resource "aws_iam_role" "ecs_service" {
  name                = "ECS-service-role-test-task"
  path                = "/"
  assume_role_policy  = data.aws_iam_policy_document.ecs_service.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.ecs_service.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}