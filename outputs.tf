#----------Bucket output----------#
output "bucket_name" {
  value       = module.aws-s3.bucket_name
  description = "Show created bucket name for this module"
}

#----------Server output----------#
output "server_ip" {
  value       = module.aws-instance.server_public_ip
  description = "Show server IP"
}

output "game_port" {
  value = module.aws-security-group.sec_group_game_port
}

output "private_key_name" {
  value = module.aws-private-key.private_key_name
}
