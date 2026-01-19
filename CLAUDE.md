# CLAUDE.md

Reusable Terraform module for Redis Enterprise Cloud clusters on GCP. Creates subscriptions, databases, and configures VPC peering.

## Structure

```
main.tf           # Provider configuration
redis.tf          # Subscription and database resources
variables.tf      # Input variables
outputs.tf        # Module outputs
```

## Notes

- Provider: rediscloud (>= 2.3.1)
- Module only - reference via `github.com/dapperlabs-platform/terraform-redis-cluster-gcp.git?ref=<version>`
- Key vars: `project_subscription_name`, `database_name`, `memory_limit_in_gb`, `redis_db_password`, `networking_deployment_cidr`
- TLS and replication enabled by default
