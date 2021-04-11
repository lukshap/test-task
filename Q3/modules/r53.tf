resource "aws_route53_record" "this" {
  zone_id = data.terraform_remote_state.this.outputs.r53_zone_id
  name    = "ALB"
  type    = "A"

  alias {
    name                   = aws_lb.this.dns_name
    zone_id                = aws_lb.this.zone_id
    evaluate_target_health = true
  }
}