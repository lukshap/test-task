variable "region" {
  type        = string
  description = "AWS region"
}

variable "ecs_name" {
  type        = string
  description = "The ECS name"
}

variable "ecs_nodes_max" {
  type        = number
  description = "The max amount ECS nodes"
}

variable "ecs_nodes_min" {
  type        = number
  description = "The min amount ECS nodes"
}

variable "ecs_nodes_desired" {
  type        = number
  description = "The desired amount ECS nodes"
}

variable "ec2_type" {
  type        = string
  description = "The instance type of EC2 instances"
}

variable "key_name" {
  type        = string
  description = "The ssh key name"
}

variable "tg_name" {
  type        = string
  description = "The target group type"
}

variable "alb_name" {
  type        = string
  description = "The alb type"
}

variable "alb_type" {
  description = "The alb type"
}

variable "alb_idle_timeout" {
  type        = number
  description = "The alb idle timeout"
}

variable "alb_listener_port" {
  type        = number
  description = "The listener port"
}

variable "alb_listener_protocol" {
  type        = string
  description = "The listener protocol"
}

variable "service_desired_count" {
  type        = number
  description = "The desired number of services"
}

variable "svc_port" {
  type        = number
  description = "The service port"
}

variable "svc_protocol" {
  type        = string
  description = "The service protocol"
}

variable "tags" {
  description = "Tags for resources"
  type = map(string)
}