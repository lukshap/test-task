resource "aws_security_group" "this" {
  name        = "SG test task"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.this.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge({Name="SG-test-task"},var.tags)
}

resource "aws_instance" "this" {
  count = var.ec2_instance_count

  ami             = data.aws_ami.this.id
  instance_type   = var.ec2_type

  subnet_id                   = aws_subnet.this.id
  security_groups             = [aws_security_group.this.id]
  key_name                    = "luksha_aws"
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.this.name

  tags = merge({Name=format("EC2-%s-test-tasks", count.index + 1)},var.tags)
}