resource "aws_vpc" "this" {
  cidr_block       = "10.0.0.0/16"

  tags = merge({Name="VPC-test-task"},var.tags)
}

resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"

  tags = merge({Name="Subnet-test-task"},var.tags)
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

resource "aws_route_table_association" "this" {
    subnet_id      = aws_subnet.this.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route53_zone" "private" {
  name = "test-task.com"

  vpc {
    vpc_id = aws_vpc.this.id
  }

  tags = merge({Name="R53-test-task"},var.tags)
}