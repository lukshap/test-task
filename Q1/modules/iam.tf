resource "aws_iam_role" "this" {
  name = "test-task-IAM-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = merge({Name="IAM-role-test-task"},var.tags)
}

resource "aws_iam_role_policy" "this" {
  name = "test-task-IAM-Role-Policy"
  role = aws_iam_role.this.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "this" {
  name = "test-task-IAM-Instance-Profile"
  role = aws_iam_role.this.name
}