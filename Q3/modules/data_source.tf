data "aws_ami" "ecs" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

data terraform_remote_state "this" {
  backend = "s3"
  config = {
    bucket = "terraform-tasks"
    key    = "Q1_terraform.tfstate"
    region = "eu-west-1"
  }
}