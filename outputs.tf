output "private_endpoint" {
  description = "Private endpoint url for the redis cluster"
  value       = rediscloud_subscription.subscription.database.*.private_endpoint[0]
}

output "pubilc_endpoint" {
  description = "Private endpoint url for the redis cluster"
  value       = rediscloud_subscription.subscription.database.*.public_endpoint[0]
}
