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

variable "dataset_size_in_gb" {
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

# this setting is irrelevant in GCP and can actually cause problems
# variable "persistent_storage_encryption" {
#   type    = bool
#   default = true
# }

variable "enable_tls" {
  type    = bool
  default = true
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

variable "replication" {
  description = "Databases replication. Default: 'true'"
  type        = bool
  default     = true
}

variable "source_ips" {
  description = "List of CIDR blocks allowed to access the database publicly. If empty, only private access is enabled."
  type        = list(string)
  default = [
    "10.0.0.0/8",
    "100.64.0.0/10",
    "172.16.0.0/12",
    "192.168.0.0/16",
  ]
}

variable "modules" {
  description = "List of Redis modules to enable (e.g., RediSearch, RedisJSON, RedisTimeSeries, etc.)"
  type = list(object({
    name = string
  }))
  default = [
    {
      name = "RediSearch"
    },
    {
      name = "RedisJSON"
    },
    {
      name = "RedisTimeSeries"
    },
    {
      name = "RedisBloom"
    },
  ]
}
