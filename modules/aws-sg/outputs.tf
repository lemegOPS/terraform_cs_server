output "security_group_id" {
  value = aws_security_group.vpc_security_group.id
}

output "game_port" {
  value = var.sec_group["port_udp"]
}