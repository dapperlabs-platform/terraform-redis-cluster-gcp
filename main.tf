terraform {
  required_providers {
    rediscloud = {
      source  = "RedisLabs/rediscloud"
      version = ">= 0.2.4"
    }
  }
}

provider "rediscloud" {
  api_key    = var.api_key
}