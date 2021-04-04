module "Q2" {
  source = "./modules"

  region   = var.region
  ecr_count = var.ecr_count

  tags = var.tags
}