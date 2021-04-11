output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_id1" {
  value = aws_subnet.this.id
}

output "subnet_id2" {
  value = aws_subnet.second.id
}

output "aws_security_group_id" {
  value = aws_security_group.this.id
}

output "r53_zone_id" {
  value = aws_route53_zone.primary.zone_id
}