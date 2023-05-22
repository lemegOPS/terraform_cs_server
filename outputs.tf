#----------Bucket output----------#
output "bucket_name" {
  value       = module.aws-s3.bucket_name
  description = "Show created bucket name for this module"
}

#----------Server output----------#
output "server_ip" {
  value       = module.aws-instance.server_info
  description = "Show server IP"
}

output "server_port" {
  value = module.aws-security-group.game_port
}
