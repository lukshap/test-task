module "Q3" {
  source = "./modules"

  region            = var.region
  ecs_name          = var.ecs_name
  ecs_nodes_max     = var.ecs_nodes_max
  ecs_nodes_min     = var.ecs_nodes_min
  ecs_nodes_desired = var.ecs_nodes_desired
  ec2_type          = var.ec2_type
  key_name          = var.key_name

  tg_name               = var.tg_name
  alb_name              = var.alb_name
  alb_type              = var.alb_type
  alb_idle_timeout      = var.alb_idle_timeout
  alb_listener_port     = var.alb_listener_port
  alb_listener_protocol = var.alb_listener_protocol
  service_desired_count = var.service_desired_count
  svc_port              = var.svc_port
  svc_protocol          = var.svc_protocol

  tags = var.tags
}