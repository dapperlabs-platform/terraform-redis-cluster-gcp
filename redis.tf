locals {
  count = var.cloud_provider == "GCP" ? 1 : 0
}

resource "rediscloud_subscription" "gcp-project" {
  name                          = var.project_subscription_name
  memory_storage                = var.memory_storage
  persistent_storage_encryption = false

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

    alert {
      name  = var.db_alert_name
      value = var.db_alert_value
    }
  }

}

# resource "rediscloud_subscription_peering" "gcp-project-peering" {
#   subscription_id = rediscloud_subscription.gcp-project.id
#   provider_name = var.cloud_provider
#   gcp_project_id = var.project_id
#   gcp_network_name = var.network_name
# }

# resource "google_compute_network_peering" "gcp-network-peering" {
#   name         = var.network_peering_name
#   network      = var.network_name
#   peer_network = format(
#       "https://www.googleapis.com/compute/v1/projects/%s/global/networks/%s",
#       rediscloud_subscription_peering.gcp-project-peering.gcp_project_id, 
#       rediscloud_subscription_peering.gcp-project-peering.gcp_redis_network_name 
#     )
# } 


