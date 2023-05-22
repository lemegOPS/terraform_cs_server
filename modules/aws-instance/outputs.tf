output "server_info" {
  value = aws_instance.server.public_ip
}

output "servers" {
  value = aws_instance.server.id
}
