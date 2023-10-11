<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | = 2.21.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.30.0, <= 3.53.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | = 3.1.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_flows"></a> [flows](#module\_flows) | git::https://github.com/pagopa/terraform-azurerm-v3.git//storage_account | v6.4.1 |
| <a name="module_gpd_payments_cosmosdb_account"></a> [gpd\_payments\_cosmosdb\_account](#module\_gpd\_payments\_cosmosdb\_account) | git::https://github.com/pagopa/terraform-azurerm-v3.git//cosmosdb_account | v7.0.0 |
| <a name="module_gps_cosmosdb_account"></a> [gps\_cosmosdb\_account](#module\_gps\_cosmosdb\_account) | git::https://github.com/pagopa/terraform-azurerm-v3.git//cosmosdb_account | v6.4.1 |
| <a name="module_gps_cosmosdb_containers"></a> [gps\_cosmosdb\_containers](#module\_gps\_cosmosdb\_containers) | git::https://github.com/pagopa/terraform-azurerm-v3.git//cosmosdb_sql_container | v6.4.1 |
| <a name="module_gps_cosmosdb_database"></a> [gps\_cosmosdb\_database](#module\_gps\_cosmosdb\_database) | git::https://github.com/pagopa/terraform-azurerm-v3.git//cosmosdb_sql_database | v6.4.1 |
| <a name="module_gps_cosmosdb_snet"></a> [gps\_cosmosdb\_snet](#module\_gps\_cosmosdb\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v6.6.1 |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault | v6.4.1 |
| <a name="module_payments_receipt_sa"></a> [payments\_receipt\_sa](#module\_payments\_receipt\_sa) | git::https://github.com/pagopa/terraform-azurerm-v3.git//storage_account | v6.6.1 |
| <a name="module_postgres_flexible_server_private"></a> [postgres\_flexible\_server\_private](#module\_postgres\_flexible\_server\_private) | git::https://github.com/pagopa/terraform-azurerm-v3//postgres_flexible_server | v6.11.2 |
| <a name="module_postgres_flexible_snet"></a> [postgres\_flexible\_snet](#module\_postgres\_flexible\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3//subnet | v6.11.2 |
| <a name="module_postgresql"></a> [postgresql](#module\_postgresql) | git::https://github.com/pagopa/terraform-azurerm-v3//postgresql_server | v6.11.2 |
| <a name="module_postgresql_snet"></a> [postgresql\_snet](#module\_postgresql\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3//subnet | v6.11.2 |

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_table.payments_receipts_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_table) | resource |
| [azurerm_key_vault_access_policy.ad_group_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.adgroup_developers_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.azdevops_iac_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_secret.ai_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.cosmos_gps_pkey](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.db_url](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.flows_sa_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd-paa-password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_apiconfig_subscription_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_db_pwd](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_db_usr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_donations_subscription_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_gpd_subscription_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_gps_subscription_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_iuv_generator_subscription_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_payments_rest_subscription_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_payments_soap_subscription_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_reporting_batch_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_reporting_enrollment_subscription_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.gpd_reporting_subscription_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.monitor_notification_email](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.monitor_notification_slack_email](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.payments_cosmos_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.pgres_admin_login](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.pgres_admin_pwd](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.storage_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.storage_reporting_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_monitor_scheduled_query_rules_alert.payments_gpd_inconsistency_error](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_scheduled_query_rules_alert) | resource |
| [azurerm_postgresql_database.apd_db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_database) | resource |
| [azurerm_postgresql_flexible_server_configuration.apd_db_flex_ignore_startup_parameters](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_configuration.apd_db_flex_max_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_configuration.apd_db_flex_min_pool_size](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_database.apd_db_flex](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database) | resource |
| [azurerm_private_dns_a_record.ingress](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_resource_group.gpd_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.gps_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.sec_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_container.reporting_flows_container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_storage_queue.reporting_flows_queue](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_queue) | resource |
| [azurerm_storage_queue.reporting_options_queue](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_queue) | resource |
| [azurerm_storage_queue.reporting_organizations_queue](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_queue) | resource |
| [azurerm_storage_table.payments_receipts_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_table) | resource |
| [azurerm_storage_table.reporting_flows_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_table) | resource |
| [azurerm_storage_table.reporting_organizations_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_table) | resource |
| [azuread_group.adgroup_admin](https://registry.terraform.io/providers/hashicorp/azuread/2.21.0/docs/data-sources/group) | data source |
| [azuread_group.adgroup_developers](https://registry.terraform.io/providers/hashicorp/azuread/2.21.0/docs/data-sources/group) | data source |
| [azuread_group.adgroup_externals](https://registry.terraform.io/providers/hashicorp/azuread/2.21.0/docs/data-sources/group) | data source |
| [azuread_group.adgroup_security](https://registry.terraform.io/providers/hashicorp/azuread/2.21.0/docs/data-sources/group) | data source |
| [azuread_service_principal.iac_principal](https://registry.terraform.io/providers/hashicorp/azuread/2.21.0/docs/data-sources/service_principal) | data source |
| [azurerm_application_insights.application_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/application_insights) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault_secret.pgres_admin_login](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.pgres_admin_pwd](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_log_analytics_workspace.log_analytics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_monitor_action_group.email](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_action_group) | data source |
| [azurerm_monitor_action_group.opsgenie](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_action_group) | data source |
| [azurerm_monitor_action_group.slack](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_action_group) | data source |
| [azurerm_private_dns_zone.cosmos](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.cosmos_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.internal](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_dns_zone.postgres](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_resource_group.data](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.flex_data](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.monitor_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.aks_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_insights_name"></a> [application\_insights\_name](#input\_application\_insights\_name) | Specifies the name of the Application Insights. | `string` | n/a | yes |
| <a name="input_cidr_subnet_gpd_payments_cosmosdb"></a> [cidr\_subnet\_gpd\_payments\_cosmosdb](#input\_cidr\_subnet\_gpd\_payments\_cosmosdb) | Cosmos DB gpd payments address space | `list(string)` | `null` | no |
| <a name="input_cidr_subnet_gps_cosmosdb"></a> [cidr\_subnet\_gps\_cosmosdb](#input\_cidr\_subnet\_gps\_cosmosdb) | Cosmos DB address space | `list(string)` | `null` | no |
| <a name="input_cidr_subnet_pg_flex_dbms"></a> [cidr\_subnet\_pg\_flex\_dbms](#input\_cidr\_subnet\_pg\_flex\_dbms) | Postgres Flexible Server network address space. | `list(string)` | n/a | yes |
| <a name="input_cosmos_gpd_payments_db_params"></a> [cosmos\_gpd\_payments\_db\_params](#input\_cosmos\_gpd\_payments\_db\_params) | n/a | <pre>object({<br>    kind           = string<br>    capabilities   = list(string)<br>    offer_type     = string<br>    server_version = string<br>    consistency_policy = object({<br>      consistency_level       = string<br>      max_interval_in_seconds = number<br>      max_staleness_prefix    = number<br>    })<br>    main_geo_location_zone_redundant = bool<br>    enable_free_tier                 = bool<br>    main_geo_location_zone_redundant = bool<br>    additional_geo_locations = list(object({<br>      location          = string<br>      failover_priority = number<br>      zone_redundant    = bool<br>    }))<br>    private_endpoint_enabled          = bool<br>    public_network_access_enabled     = bool<br>    is_virtual_network_filter_enabled = bool<br>    backup_continuous_enabled         = bool<br>    payments_receipts_table = object({<br>      autoscale  = bool<br>      throughput = number<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_cosmos_gps_db_params"></a> [cosmos\_gps\_db\_params](#input\_cosmos\_gps\_db\_params) | n/a | <pre>object({<br>    kind           = string<br>    capabilities   = list(string)<br>    offer_type     = string<br>    server_version = string<br>    consistency_policy = object({<br>      consistency_level       = string<br>      max_interval_in_seconds = number<br>      max_staleness_prefix    = number<br>    })<br>    main_geo_location_zone_redundant = bool<br>    enable_free_tier                 = bool<br>    main_geo_location_zone_redundant = bool<br>    additional_geo_locations = list(object({<br>      location          = string<br>      failover_priority = number<br>      zone_redundant    = bool<br>    }))<br>    private_endpoint_enabled          = bool<br>    public_network_access_enabled     = bool<br>    is_virtual_network_filter_enabled = bool<br>    backup_continuous_enabled         = bool<br>  })</pre> | n/a | yes |
| <a name="input_dns_zone_internal_prefix"></a> [dns\_zone\_internal\_prefix](#input\_dns\_zone\_internal\_prefix) | The dns subdomain. | `string` | `null` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | n/a | yes |
| <a name="input_enable_iac_pipeline"></a> [enable\_iac\_pipeline](#input\_enable\_iac\_pipeline) | If true create the key vault policy to allow used by azure devops iac pipelines. | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_env_short"></a> [env\_short](#input\_env\_short) | n/a | `string` | n/a | yes |
| <a name="input_external_domain"></a> [external\_domain](#input\_external\_domain) | Domain for delegation | `string` | `null` | no |
| <a name="input_gpd_db_name"></a> [gpd\_db\_name](#input\_gpd\_db\_name) | Name of the DB to connect to | `string` | `"apd"` | no |
| <a name="input_gpd_enable_versioning"></a> [gpd\_enable\_versioning](#input\_gpd\_enable\_versioning) | Enable sa versioning | `bool` | `false` | no |
| <a name="input_gpd_payments_advanced_threat_protection"></a> [gpd\_payments\_advanced\_threat\_protection](#input\_gpd\_payments\_advanced\_threat\_protection) | Enable contract threat advanced protection | `bool` | `false` | no |
| <a name="input_gpd_payments_delete_retention_days"></a> [gpd\_payments\_delete\_retention\_days](#input\_gpd\_payments\_delete\_retention\_days) | Number of days to retain deleted. | `number` | `30` | no |
| <a name="input_gpd_payments_versioning"></a> [gpd\_payments\_versioning](#input\_gpd\_payments\_versioning) | Enable sa versioning | `bool` | `false` | no |
| <a name="input_gpd_reporting_advanced_threat_protection"></a> [gpd\_reporting\_advanced\_threat\_protection](#input\_gpd\_reporting\_advanced\_threat\_protection) | Enable contract threat advanced protection | `bool` | `false` | no |
| <a name="input_gpd_reporting_delete_retention_days"></a> [gpd\_reporting\_delete\_retention\_days](#input\_gpd\_reporting\_delete\_retention\_days) | Number of days to retain deleted. | `number` | `30` | no |
| <a name="input_ingress_load_balancer_ip"></a> [ingress\_load\_balancer\_ip](#input\_ingress\_load\_balancer\_ip) | n/a | `string` | n/a | yes |
| <a name="input_instance"></a> [instance](#input\_instance) | One of beta, prod01, prod02 | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | One of westeurope, northeurope | `string` | n/a | yes |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | One of wue, neu | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Specifies the name of the Log Analytics Workspace. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_resource_group_name"></a> [log\_analytics\_workspace\_resource\_group\_name](#input\_log\_analytics\_workspace\_resource\_group\_name) | The name of the resource group in which the Log Analytics workspace is located in. | `string` | n/a | yes |
| <a name="input_monitor_resource_group_name"></a> [monitor\_resource\_group\_name](#input\_monitor\_resource\_group\_name) | Monitor resource group name | `string` | n/a | yes |
| <a name="input_pgflex_public_metric_alerts"></a> [pgflex\_public\_metric\_alerts](#input\_pgflex\_public\_metric\_alerts) | Map of name = criteria objects | <pre>map(object({<br>    # criteria.*.aggregation to be one of [Average Count Minimum Maximum Total]<br>    aggregation = string<br>    # "Insights.Container/pods" "Insights.Container/nodes"<br>    metric_namespace = string<br>    metric_name      = string<br>    # criteria.0.operator to be one of [Equals NotEquals GreaterThan GreaterThanOrEqual LessThan LessThanOrEqual]<br>    operator  = string<br>    threshold = number<br>    # Possible values are PT1M, PT5M, PT15M, PT30M and PT1H<br>    frequency = string<br>    # Possible values are PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H and P1D.<br>    window_size = string<br>    # severity: The severity of this Metric Alert. Possible values are 0, 1, 2, 3 and 4. Defaults to 3. Lower is worst<br>    severity = number<br>  }))</pre> | <pre>{<br>  "active_connections": {<br>    "aggregation": "Average",<br>    "frequency": "PT5M",<br>    "metric_name": "active_connections",<br>    "metric_namespace": "Microsoft.DBforPostgreSQL/flexibleServers",<br>    "operator": "GreaterThan",<br>    "severity": 2,<br>    "threshold": 4000,<br>    "window_size": "PT30M"<br>  },<br>  "connections_failed": {<br>    "aggregation": "Total",<br>    "frequency": "PT5M",<br>    "metric_name": "connections_failed",<br>    "metric_namespace": "Microsoft.DBforPostgreSQL/flexibleServers",<br>    "operator": "GreaterThan",<br>    "severity": 2,<br>    "threshold": 10,<br>    "window_size": "PT30M"<br>  },<br>  "cpu_percent": {<br>    "aggregation": "Average",<br>    "frequency": "PT5M",<br>    "metric_name": "cpu_percent",<br>    "metric_namespace": "Microsoft.DBforPostgreSQL/flexibleServers",<br>    "operator": "GreaterThan",<br>    "severity": 2,<br>    "threshold": 80,<br>    "window_size": "PT30M"<br>  },<br>  "memory_percent": {<br>    "aggregation": "Average",<br>    "frequency": "PT5M",<br>    "metric_name": "memory_percent",<br>    "metric_namespace": "Microsoft.DBforPostgreSQL/flexibleServers",<br>    "operator": "GreaterThan",<br>    "severity": 2,<br>    "threshold": 80,<br>    "window_size": "PT30M"<br>  },<br>  "storage_percent": {<br>    "aggregation": "Average",<br>    "frequency": "PT5M",<br>    "metric_name": "storage_percent",<br>    "metric_namespace": "Microsoft.DBforPostgreSQL/flexibleServers",<br>    "operator": "GreaterThan",<br>    "severity": 2,<br>    "threshold": 80,<br>    "window_size": "PT30M"<br>  }<br>}</pre> | no |
| <a name="input_pgres_flex_params"></a> [pgres\_flex\_params](#input\_pgres\_flex\_params) | Postgres Flexible | <pre>object({<br>    private_endpoint_enabled     = bool<br>    sku_name                     = string<br>    db_version                   = string<br>    storage_mb                   = string<br>    zone                         = number<br>    backup_retention_days        = number<br>    geo_redundant_backup_enabled = bool<br>    high_availability_enabled    = bool<br>    standby_availability_zone    = number<br>    pgbouncer_enabled            = bool<br>    alerts_enabled               = bool<br>    max_connections              = number<br>  })</pre> | `null` | no |
| <a name="input_postgresql_network_rules"></a> [postgresql\_network\_rules](#input\_postgresql\_network\_rules) | Network rules restricting access to the postgresql server. | <pre>object({<br>    ip_rules                       = list(string)<br>    allow_access_to_azure_services = bool<br>  })</pre> | <pre>{<br>  "allow_access_to_azure_services": false,<br>  "ip_rules": []<br>}</pre> | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | (Optional) Fn app storage acocunt replication type | `string` | `"LRS"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | <pre>{<br>  "CreatedBy": "Terraform"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
