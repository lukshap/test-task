data "aws_ami" "this" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name = "name"

    values = [
      "amzn2-ami-hvm-2.0.20210326.0-x86_64-gp2"
    ]
  }
}