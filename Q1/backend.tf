terraform {
  backend "s3" {
    bucket         = "terraform-tasks"
    key            = "Q1_terraform.tfstate"
    region         = "eu-west-1"
    profile        = "default"
  }
}
variable "awscli_profile" {
  type        = string
  description = "Name of your ~/.aws/credentials profile"
  default     = "default"
}

provider "aws" {
  profile = var.awscli_profile
  region  = var.region
}
