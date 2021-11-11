terraform {
  required_providers {
    rediscloud = {
      source  = "RedisLabs/rediscloud"
      version = ">= 0.2.4"
    }
    grafana = {
      source  = "grafana/grafana"
      version = ">=1.14.0"
    }
  }
}
