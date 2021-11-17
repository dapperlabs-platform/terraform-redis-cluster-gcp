resource "grafana_folder" "redis_cloud" {
  count = var.create_grafana_dashboards ? 1 : 0
  title = "${var.folder_name} Redis Cloud"
}

resource "grafana_dashboard" "redis_cloud_dashboard" {
  count = var.create_grafana_dashboards ? 1 : 0
  folder = grafana_folder.redis_cloud[0].id
  config_json = templatefile(
    "${path.module}/templates/redis-dashboard.json",
    {
      DS_PROMETHEUS1 = var.datasource
    }
  )
}
