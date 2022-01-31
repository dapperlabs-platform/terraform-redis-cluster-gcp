
resource "rediscloud_subscription" "subscription" {
  name                          = var.project_subscription_name
  memory_storage                = var.memory_storage
  persistent_storage_encryption = var.persistent_storage_encryption

  cloud_provider {
    provider         = var.cloud_provider
    cloud_account_id = 1
    region {
      region                       = var.region
      networking_deployment_cidr   = var.networking_deployment_cidr
      preferred_availability_zones = var.preferred_availability_zones
      multiple_availability_zones  = var.multiple_availability_zones
    }
  }

  database {
    name                         = var.database_name
    protocol                     = var.database_protocol
    memory_limit_in_gb           = var.memory_limit_in_gb
    data_persistence             = var.data_persistence
    throughput_measurement_by    = var.throughput_measurement_by
    throughput_measurement_value = var.throughput_measurement_value
    password                     = var.redis_db_password
    replication                  = var.replication
    enable_tls                   = var.enable_tls

    alert {
      name  = var.db_alert_name
      value = var.db_alert_value
    }
  }

}


