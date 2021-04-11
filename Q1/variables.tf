variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-1"
}

variable "ttl" {
  type        = string
  description = "TTL for R53"
  default     = "300"
}

variable "key_name" {
  type        = string
  description = "The ssh kye name"
  default     = "luksha_aws"
}

variable "ec2_type" {
  type        = string
  description = "The instance type of EC2 instances"
  default     = "t2.micro"
}

variable "ec2_instance_count" {
  type        = number
  description = "The EC2 instance count"
  default     = 1
}

variable "tags" {
  description = "Tags for resources"
  type = map(string)
  default = {
    Purpose      = "test-task"
    Email        = "lukshap@gmail.com"
  }
}