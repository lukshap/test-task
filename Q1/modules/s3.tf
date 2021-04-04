resource "aws_s3_bucket" "this" {
  bucket = "test-task-bucket-2021-april"
  acl    = "private"

  tags = merge({Name="S3-bucket-test-task"},var.tags)
}