output "alb_service_endpoint" {
  value = aws_route53_record.this.fqdn
}