terraform {
  required_providers {
    rediscloud = {
      source  = "RedisLabs/rediscloud"
      version = "= 0.2.9"
    }
  }
}

locals {
  cloud_provider = "GCP"
}
