variable "region" {
  type        = string
  description = "AWS region"
}

variable "ecr_count" {
  type        = number
  description = "The amount of ECR"
}

variable "tags" {
  description = "Tags for resources"
  type = map(string)
}