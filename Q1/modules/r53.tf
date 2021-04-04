resource "aws_route53_record" "this" {
  count   = var.ec2_instance_count
  zone_id = aws_route53_zone.private.zone_id
  name    = format("ec2-%s.test-tasks.com", count.index + 1)
  type    = "A"
  ttl     = var.ttl
  records = [aws_instance.this[count.index].public_ip]
}