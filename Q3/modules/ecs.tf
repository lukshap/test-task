resource "aws_ecs_cluster" "this" {
  name = var.ecs_name

  tags = merge({Name="ECS-test-task"},var.tags)
}

data "template_file" "user_data" {
  template = file("${path.module}/user_data.sh")

  vars = {
    ecs_cluster = aws_ecs_cluster.this.name
  }
}

resource "aws_launch_configuration" "this" {
  name_prefix          = format("LC-test-task-%s",var.ecs_name)
  image_id             = data.aws_ami.ecs.id
  instance_type        = var.ec2_type
  iam_instance_profile = aws_iam_instance_profile.ecs_ec2_instance.name
  user_data            = data.template_file.user_data.rendered
  security_groups      = [data.terraform_remote_state.this.outputs.aws_security_group_id]
  key_name             = var.key_name

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  name = format("ASG-test-task-%s",var.ecs_name)

  launch_configuration = aws_launch_configuration.this.name
  vpc_zone_identifier  = [data.terraform_remote_state.this.outputs.subnet_id1,data.terraform_remote_state.this.outputs.subnet_id2]
  max_size             = var.ecs_nodes_max
  min_size             = var.ecs_nodes_min
  desired_capacity     = var.ecs_nodes_desired

  health_check_grace_period = 300
  health_check_type         = "EC2"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ecs_task_definition" "this" {
  family = "test-task"

  container_definitions = jsonencode([
    {
      name = "nginx"
      image = "nginx:1.13-alpine"
      essential = true
      memory = 128
      cpu = 100
      portMappings = [
        {
          containerPort = 80
          hostPort = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "this" {
  name            = "ECS-service-test-task"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  iam_role        = aws_iam_role.ecs_service.name
  desired_count   = var.service_desired_count

  load_balancer {
      target_group_arn  = aws_lb_target_group.this.arn
      container_port    = 80
      container_name    = "nginx"
  }

  depends_on = [aws_lb_target_group.this]
}