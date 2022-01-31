# Redis Enterprise Cluster

https://www.redislabs.com/

https://registry.terraform.io/providers/RedisLabs/rediscloud/latest

## What does this do?

Creates all resources (Subscription, Clusters, Databases and VPC peering) needed to provison a redis enterprise cluster

## How to use this module?

```hcl
module "nfl-redis-cluster" {
    source = "github.com/dapperlabs-platform/terraform-redis-cluster-gcp.git?ref=vX.Y.Z"
    project_subscription_name = "test-subscription"
    region = var.region
    networking_deployment_cidr = var.cidr
    preferred_availability_zones = var.availability_zones
    database_name = "test-db"
    database_protocol = "redis"
    memory_limit_in_gb = 2
    data_persistence = "none"
    throughput_measurement_by = "operations-per-second"
    throughput_measurement_value = 10000
    redis_db_password = "<insert_secure_password_here>"
    db_alert_name = "throughput-higher-than"
    db_alert_value = 40
    cloud_provider = "GCP"
}
```

## Resources created

- Redis Cloud Subscription
- Subscription Peering
- Redis Database

## Additional information

In order to setup authentication with the Redis Enterprise Cloud provider a programmatic API key must be generated for Redis Enterprise Cloud. The Redis Enterprise Cloud documentation contains the most up-to-date instructions for creating and managing your key(s) and IP access.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_rediscloud"></a> [rediscloud](#requirement\_rediscloud) | = 0.2.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_rediscloud"></a> [rediscloud](#provider\_rediscloud) | 0.2.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [rediscloud_subscription.subscription](https://registry.terraform.io/providers/RedisLabs/rediscloud/0.2.8/docs/resources/subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | Set Cloud Provider to use | `string` | n/a | yes |
| <a name="input_data_persistence"></a> [data\_persistence](#input\_data\_persistence) | Rate of database data persistence | `string` | `"none"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Identifier of the database created | `string` | n/a | yes |
| <a name="input_database_protocol"></a> [database\_protocol](#input\_database\_protocol) | The protocol that will be used to access the database | `string` | `"redis"` | no |
| <a name="input_db_alert_name"></a> [db\_alert\_name](#input\_db\_alert\_name) | Set DB Alert name | `string` | `"dataset-size"` | no |
| <a name="input_db_alert_value"></a> [db\_alert\_value](#input\_db\_alert\_value) | Set DB Alert value | `string` | `"50"` | no |
| <a name="input_enable_tls"></a> [enable\_tls](#input\_enable\_tls) | n/a | `bool` | `true` | no |
| <a name="input_memory_limit_in_gb"></a> [memory\_limit\_in\_gb](#input\_memory\_limit\_in\_gb) | Maximum memory usage for this specific database | `number` | n/a | yes |
| <a name="input_memory_storage"></a> [memory\_storage](#input\_memory\_storage) | Memory storage preference: either ram or a combination of ram-and-flash | `string` | `"ram"` | no |
| <a name="input_multiple_availability_zones"></a> [multiple\_availability\_zones](#input\_multiple\_availability\_zones) | Multiple AZs | `bool` | `true` | no |
| <a name="input_networking_deployment_cidr"></a> [networking\_deployment\_cidr](#input\_networking\_deployment\_cidr) | Deployment CIDR mask. | `string` | n/a | yes |
| <a name="input_persistent_storage_encryption"></a> [persistent\_storage\_encryption](#input\_persistent\_storage\_encryption) | n/a | `bool` | `true` | no |
| <a name="input_preferred_availability_zones"></a> [preferred\_availability\_zones](#input\_preferred\_availability\_zones) | Support deployment on multiple availability zones within the selected region | `list(string)` | `[]` | no |
| <a name="input_project_subscription_name"></a> [project\_subscription\_name](#input\_project\_subscription\_name) | Redis Enterprise subscription name | `string` | n/a | yes |
| <a name="input_redis_db_password"></a> [redis\_db\_password](#input\_redis\_db\_password) | Password used to access the database | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP Region | `string` | n/a | yes |
| <a name="input_replication"></a> [replication](#input\_replication) | Databases replication. Default: ‘true’ | `bool` | `true` | no |
| <a name="input_throughput_measurement_by"></a> [throughput\_measurement\_by](#input\_throughput\_measurement\_by) | Throughput measurement method | `string` | `"operations-per-second"` | no |
| <a name="input_throughput_measurement_value"></a> [throughput\_measurement\_value](#input\_throughput\_measurement\_value) | Throughput value (as applies to selected measurement method) | `string` | `"5000"` | no |

## Outputs

No outputs.
