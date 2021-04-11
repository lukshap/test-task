variable "region" {
  type        = string
  description = "AWS region"
}

variable "ttl" {
  type        = string
  description = "TTL for R53"
}

variable "key_name" {
  type        = string
  description = "The ssh key name"
}

variable "ec2_type" {
  type        = string
  description = "The instance type of EC2 instances"
}

variable "ec2_instance_count" {
  type        = number
  description = "The EC2 instance count"
}


variable "tags" {
  description = "Tags for resources"
  type = map(string)
}