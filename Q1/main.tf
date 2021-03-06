module "Q1" {
  source = "./modules"

  region             = var.region
  key_name           = var.key_name
  ec2_type           = var.ec2_type
  ec2_instance_count = var.ec2_instance_count
  ttl                = var.ttl

  tags = var.tags
}