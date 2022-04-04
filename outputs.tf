output "database_private_endpoint" {
  description = "Private endpoint url for the redis cluster"
  value       = rediscloud_subscription.subscription.database[0].database.private_endpoint
}

output "database_pubilc_endpoint" {
  description = "Private endpoint url for the redis cluster"
  value       = rediscloud_subscription.subscription.database[0].database.public_endpoint
}