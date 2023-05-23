output "security_group_id" {
  value = aws_security_group.vpc_security_group.id
}

output "sec_group_game_port" {
  value = join(",", var.sec_group["port_udp"])
}