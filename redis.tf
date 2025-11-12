
resource "rediscloud_subscription" "subscription" {
  name           = var.project_subscription_name
  memory_storage = var.memory_storage

  cloud_provider {
    provider         = local.cloud_provider
    cloud_account_id = 1
    region {
      region                       = var.region
      networking_deployment_cidr   = var.networking_deployment_cidr
      preferred_availability_zones = var.preferred_availability_zones
      multiple_availability_zones  = var.multiple_availability_zones
    }
  }

  creation_plan {
    dataset_size_in_gb           = var.dataset_size_in_gb
    quantity                     = 1
    replication                  = var.replication
    throughput_measurement_by    = var.throughput_measurement_by
    throughput_measurement_value = var.throughput_measurement_value
  }

  lifecycle {
    ignore_changes = [
      customer_managed_key_deletion_grace_period,
      customer_managed_key_enabled,
    ]
  }

}

resource "rediscloud_subscription_database" "database" {
  subscription_id              = rediscloud_subscription.subscription.id
  name                         = var.database_name
  protocol                     = var.database_protocol
  dataset_size_in_gb           = var.dataset_size_in_gb
  data_persistence             = var.data_persistence
  throughput_measurement_by    = var.throughput_measurement_by
  throughput_measurement_value = var.throughput_measurement_value
  password                     = var.redis_db_password
  replication                  = var.replication
  enable_tls                   = var.enable_tls
  source_ips                   = var.source_ips

  alert {
    name  = var.db_alert_name
    value = var.db_alert_value
  }

  dynamic "modules" {
    for_each = var.modules
    content {
      name = modules.value.name
    }
  }

  depends_on = [rediscloud_subscription.subscription]
}
