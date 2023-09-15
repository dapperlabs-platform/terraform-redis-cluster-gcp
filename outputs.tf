output "db_id" {
  description = "Private endpoint url for the redis cluster"
  value       = rediscloud_subscription.subscription.database.*.db_id[0]
}

output "private_endpoint" {
  description = "Private endpoint url for the redis cluster"
  value       = rediscloud_subscription.subscription.database.*.private_endpoint[0]
}

output "public_endpoint" {
  description = "Private endpoint url for the redis cluster"
  value       = rediscloud_subscription.subscription.database.*.public_endpoint[0]
}

output "subscription_id" {
  description = "Subscription identifier for the redis cluster"
  value       = rediscloud_subscription.subscription.id
}
