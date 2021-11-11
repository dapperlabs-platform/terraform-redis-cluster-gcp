data "rediscloud_database" "redis-subscription" {
  subscription_id = rediscloud_subscription.gcp-project.id
  name            = rediscloud_subscription.gcp-project.name
}

resource "grafana_folder" "redis_cloud" {
  title = "${var.folder_name} Redis Cloud"
}

resource "grafana_dashboard" "redis_cloud_dashboard" {
  folder = grafana_folder.redis_cloud.id
  config_json = templatefile(
    "${path.module}/templates/redis-dashboard.json",
    {
      datasource = data.rediscloud_database.redis-subscription.public_endpoint
    }
  )
}
