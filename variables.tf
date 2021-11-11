variable "project_subscription_name" {
  description = "Redis Enterprise subscription name"
  type        = string
}

variable "memory_storage" {
  description = "Memory storage preference: either ram or a combination of ram-and-flash"
  type        = string
  default     = "ram"
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "networking_deployment_cidr" {
  description = "Deployment CIDR mask."
  type        = string
}

variable "preferred_availability_zones" {
  description = "Support deployment on multiple availability zones within the selected region"
  type        = list(string)
  default     = []
}

variable "multiple_availability_zones" {
  description = "Multiple AZs"
  type        = bool
  default     = true
}

variable "database_name" {
  description = "Identifier of the database created"
  type        = string
}

variable "database_protocol" {
  description = "The protocol that will be used to access the database"
  type        = string
  default     = "redis"
}

variable "memory_limit_in_gb" {
  description = "Maximum memory usage for this specific database "
  type        = number
}

variable "data_persistence" {
  description = "Rate of database data persistence "
  type        = string
  default     = "none"
}

variable "throughput_measurement_by" {
  description = " Throughput measurement method"
  type        = string
  default     = "operations-per-second"
}

variable "throughput_measurement_value" {
  description = "Throughput value (as applies to selected measurement method)"
  type        = string
  default     = "5000"
}

variable "redis_db_password" {
  description = "Password used to access the database"
  type        = string
}

variable "persistent_storage_encryption" {
  type    = bool
  default = true
}

variable "network_peering_name" {
  description = "The name of the Redis Enterprise Cloud network to be peered"
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "network_name" {
  description = "GCP Project Network Name"
  type        = string
}

variable "db_alert_name" {
  description = "Set DB Alert name"
  type        = string
  default     = "dataset-size"
}

variable "db_alert_value" {
  description = "Set DB Alert value"
  type        = string
  default     = "50"
}

variable "cloud_provider" {
  description = "Set Cloud Provider to use"
  type        = string
}

variable "replication" {
  description = "Databases replication. Default: ‘true’"
  type        = bool
  default = true
}

variable "datasource" {
  description = "Redis database public_endpoint to be used as datasource url"
  type        = bool
}