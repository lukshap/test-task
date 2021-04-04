variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-1"
}

variable "ecr_count" {
  type        = number
  description = "The amount of of ECR"
  default     = 2
}

variable "tags" {
  description = "Tags for resources"
  type = map(string)
  default = {
    Purpose      = "test-task"
    Email        = "lukshap@gmail.com"
  }
}