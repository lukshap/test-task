variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-1"
}

variable "ecs_name" {
  type        = string
  description = "The ECS name"
  default     = "test-task"
}

variable "ecs_nodes_max" {
  type        = number
  description = "The max amount ECS nodes"
  default     = 1
}

variable "ecs_nodes_min" {
  type        = number
  description = "The min amount ECS nodes"
  default     = 1
}

variable "ecs_nodes_desired" {
  type        = number
  description = "The desired amount ECS nodes"
  default     = 1
}

variable "ec2_type" {
  type        = string
  description = "The instance type of EC2 instances"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "The ssh kye name"
  default     = "luksha_aws"
}

variable "tg_name" {
  type        = string
  description = "The target group type"
  default     = "TG-test-task"
}

variable "alb_name" {
  type        = string
  description = "The alb type"
  default     = "ALB-test-task"
}

variable "alb_type" {
  description = "The alb type"
  default     = false
}

variable "alb_idle_timeout" {
  type        = number
  description = "The alb idle timeout"
  default     = 60
}

variable "alb_listener_port" {
  type        = number
  description = "The listener port"
  default     = 80
}

variable "alb_listener_protocol" {
  type        = string
  description = "The listener protocol"
  default     = "HTTP"
}

variable "service_desired_count" {
  type        = number
  description = "The desired number of services"
  default     = 1
}

variable "svc_port" {
  type        = number
  description = "The service port"
  default     = 80
}

variable "svc_protocol" {
  type        = string
  description = "The service protocol"
  default     = "HTTP"
}

variable "tags" {
  description = "Tags for resources"
  type = map(string)
  default = {
    Purpose      = "test-task"
    Email        = "lukshap@gmail.com"
  }
}