output "db_id" {
  description = "Database identifier for the redis cluster"
  value       = rediscloud_subscription_database.database.db_id
}

output "private_endpoint" {
  description = "Private endpoint url for the redis cluster"
  value       = rediscloud_subscription_database.database.private_endpoint
}

output "public_endpoint" {
  description = "Public endpoint url for the redis cluster"
  value       = rediscloud_subscription_database.database.public_endpoint
}

output "subscription_id" {
  description = "Subscription identifier for the redis cluster"
  value       = rediscloud_subscription.subscription.id
}

output "service_id" {
  description = "Service identifier for private service connect"
  value       = rediscloud_subscription.subscription.id
}
