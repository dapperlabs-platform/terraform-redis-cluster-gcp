# Redis Enterprise Cluster

https://www.redislabs.com/

https://registry.terraform.io/providers/RedisLabs/rediscloud/latest

## What does this do?

Creates all resources (Subscription, Clusters, Databases and VPC peering) needed to provison a redis enterprise cluster 

## How to use this module?

```hcl
module "nfl-redis-cluster" {
    source = "https://github.com/dapperlabs-platform/terraform-redis-cluster-gcp?ref=0.9.4"
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
    project_id = ""
    network_name = ""
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

- Terraform >= 1.0.0
- grafana/grafana >= 1.14.0
- redis >= 0.2.4

## Inputs

| Name                                                                                                                                                                                                                                    | Description                                                                                                  | Type   | Default | Required |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ------ | ------- | :------: |
| project_subscription_name                                                                                                                                                                                                                                    | A meaningful name to identify the Subscription.                     | string |         |    x     |
| memory_storage                                                                                                                                                                                                                             | (Required) Memory storage preference: either ram or a combination of ram-and-flash                                                               | string |         |    x     |
| region                                                                                                                                                                                                                              | GCP region in which to deploy the cluster. | string |         |    x     |
| networking_deployment_cidr                                                                                                                                                                                                                            | Deployment CIDR mask                                                                            | string | LOW     |          |
| preferred_availability_zones                                                                                                                                                                                                                                 | Support deployment on multiple availability zones within the selected region                                                                                            | list(string) | 5000    |          |
| multiple_availability_zones                                                                                                                                                                                                                          | Support deployment on multiple availability zones within the selected region. Default: ‘false’                                                                                  | bool | 100     |          |
| database_name                                                                                                                                                                                                                         | A meaningful name to identify the database                                                                                  | string | 100     |          |
| database_protocol                                                                                                                                                                                                                            | The protocol that will be used to access the database, (either ‘redis’ or 'memcached’) Default: ‘redis’                                                                                                 | string | BASIC   |          |
| memory_limit_in_gb                                                                                                                                                                                                                        | (Required) Maximum memory usage for this specific database                                                           | number | GCP     |          |
| data_persistence                                                                                                                                                                                                                                  |  Rate of database data persistence (in persistent storage). Default: ‘none’                                                                                     |
| throughput_measurement_by                                                                                                                                                                                                                 | (Required) Throughput measurement method, (either ‘number-of-shards’ or ‘operations-per-second’)                                                                         | string   |         |  false   |
| throughput_measurement_value                                                                                                                                                                                                              | (Required) Throughput value (as applies to selected measurement method)                                                           | number |         |       |
| redis_db_password                                                                                                                                                                                                        | (Required) Password used to access the database                                                                             | string |         |    |
| network_peering_name                                                                                                                                                                                                               | The name of the Redis Enterprise Cloud network to be peered                                                                         | string   |         |  false   |
| project_id                                                                                                                                                                                                                      | GCP Project ID                                                                      | string |         |   null   |
| network_name                                                                                                                                                                                                                      | GCP Network name                                                                      | string |         |   null   |
| db_alert_name                                                                                                                                                                                                                      | Set DB Alert name                                                                      | string |         |   null   |
| db_alert_value                                                                                                                                                                                                                      | Set DB Alert value                                                                      | number |         |   null   |
| cloud_provider                                                                                                                                                                                                                      | Set cloud provider, default is GCP                                                                      | string |         |   null   |
| api_key                                                                                                                                                                                                                      | Set API key for redis, read the #Additional Information section on how to generate this key                                                                     | string |         |   null   |
