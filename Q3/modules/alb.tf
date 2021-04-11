resource "aws_lb_target_group" "this" {
  name     = var.tg_name
  port     = var.svc_port
  protocol = var.svc_protocol
  vpc_id   = data.terraform_remote_state.this.outputs.vpc_id

  stickiness {
    type            = "lb_cookie"
    cookie_duration = 1800
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    interval            = 10
    timeout             = 5
    path                = "/"
    port                = var.svc_port
  }

  tags = merge({Name="Target_Group-test-task"},var.tags)
}

resource "aws_lb" "this" {
  name               = var.alb_name
  internal           = var.alb_type
  load_balancer_type = "application"
  subnets            = [data.terraform_remote_state.this.outputs.subnet_id1,data.terraform_remote_state.this.outputs.subnet_id2]
  security_groups    = [data.terraform_remote_state.this.outputs.aws_security_group_id]
  idle_timeout       = var.alb_idle_timeout

  tags = merge({Name="ALB-test-task"},var.tags)
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_listener_rule" "this" {
  depends_on = [aws_lb_target_group.this]

  listener_arn = aws_lb_listener.this.arn
  priority = 100

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.this.id
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}