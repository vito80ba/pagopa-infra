# general

variable "prefix" {
  type = string
  validation {
    condition = (
      length(var.prefix) <= 6
    )
    error_message = "Max length is 6 chars."
  }
}

variable "env" {
  type = string
}

variable "env_short" {
  type = string
  validation {
    condition = (
      length(var.env_short) == 1
    )
    error_message = "Length must be 1 chars."
  }
}

variable "domain" {
  type = string
  validation {
    condition = (
      length(var.domain) <= 12
    )
    error_message = "Max length is 12 chars."
  }
}

variable "location" {
  type        = string
  description = "One of westeurope, northeurope"
}

variable "location_short" {
  type = string
  validation {
    condition = (
      length(var.location_short) == 3
    )
    error_message = "Length must be 3 chars."
  }
  description = "One of wue, neu"
}

variable "instance" {
  type        = string
  description = "One of beta, prod01, prod02"
}

variable "tags" {
  type = map(any)
  default = {
    CreatedBy = "Terraform"
  }
}

### External resources

variable "monitor_resource_group_name" {
  type        = string
  description = "Monitor resource group name"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Specifies the name of the Log Analytics Workspace."
}

variable "log_analytics_workspace_resource_group_name" {
  type        = string
  description = "The name of the resource group in which the Log Analytics workspace is located in."
}

variable "ingress_load_balancer_ip" {
  type = string
}

variable "external_domain" {
  type        = string
  default     = null
  description = "Domain for delegation"
}

variable "dns_zone_internal_prefix" {
  type        = string
  default     = null
  description = "The dns subdomain."
}

variable "cidr_subnet_flex_dbms" {
  type        = list(string)
  description = "Postgresql network address space."
}

# Postgres Flexible
variable "pgres_flex_params" {
  type = object({
    enabled                                = bool
    sku_name                               = string
    db_version                             = string
    storage_mb                             = string
    zone                                   = number
    standby_ha_zone                        = number
    backup_retention_days                  = number
    geo_redundant_backup_enabled           = bool
    create_mode                            = string
    pgres_flex_private_endpoint_enabled    = bool
    pgres_flex_ha_enabled                  = bool
    pgres_flex_pgbouncer_enabled           = bool
    pgres_flex_diagnostic_settings_enabled = bool
    max_connections                        = number
  })

}

variable "pgres_flex_nodo_db_name" {
  type        = string
  description = "Nodo DB name"
  default     = "nodo"
}

variable "sftp_account_replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa"
}

variable "sftp_disable_network_rules" {
  type        = bool
  description = "If false, allow any connection from outside the vnet"
  default     = false
}

variable "sftp_ip_rules" {
  type        = list(string)
  description = "List of public IP or IP ranges in CIDR Format allowed to access the storage account. Only IPV4 addresses are allowed"
  default     = []
}

variable "sftp_enable_private_endpoint" {
  type        = bool
  description = "If true, create a private endpoint for the SFTP storage account"
}

variable "cidr_subnet_storage_account" {
  type        = list(string)
  description = "Storage account network address space."
}

variable "storage_account_snet_private_link_service_network_policies_enabled" {
  type        = bool
  description = "If true, create a private link service"
  default     = true
}

variable "custom_metric_alerts" {

  description = <<EOD
  Map of name = criteria objects
  EOD

  type = map(object({
    # criteria.*.aggregation to be one of [Average Count Minimum Maximum Total]
    aggregation = string
    metric_name = string
    # "Insights.Container/pods" "Insights.Container/nodes"
    metric_namespace = string
    # criteria.0.operator to be one of [Equals NotEquals GreaterThan GreaterThanOrEqual LessThan LessThanOrEqual]
    operator  = string
    threshold = number
    # Possible values are PT1M, PT5M, PT15M, PT30M and PT1H
    frequency = string
    # Possible values are PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H and P1D.
    window_size = string
    # severity: The severity of this Metric Alert. Possible values are 0, 1, 2, 3 and 4. Defaults to 3.
    severity = number
  }))

  default = {
    cpu_percent = {
      frequency        = "PT5M"
      window_size      = "PT30M"
      metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
      aggregation      = "Average"
      metric_name      = "cpu_percent"
      operator         = "GreaterThan"
      threshold        = 4500
      severity         = 2
    },
    memory_percent = {
      frequency        = "PT5M"
      window_size      = "PT30M"
      metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
      aggregation      = "Average"
      metric_name      = "memory_percent"
      operator         = "GreaterThan"
      threshold        = 80
      severity         = 2
    },
    storage_percent = {
      frequency        = "PT5M"
      window_size      = "PT30M"
      metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
      aggregation      = "Average"
      metric_name      = "storage_percent"
      operator         = "GreaterThan"
      threshold        = 80
      severity         = 2
    },
    active_connections = {
      frequency        = "PT5M"
      window_size      = "PT30M"
      metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
      aggregation      = "Average"
      metric_name      = "active_connections"
      operator         = "GreaterThan"
      threshold        = 80
      severity         = 2
    },
    connections_failed = {
      frequency        = "PT5M"
      window_size      = "PT30M"
      metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
      aggregation      = "Total"
      metric_name      = "connections_failed"
      operator         = "GreaterThan"
      threshold        = 80
      severity         = 2
    }
  }
}


# Redis
variable "cidr_subnet_ndp_redis" {
  type        = list(string)
  description = "Redis DB address space for NDP."
  default     = ["10.1.162.0/24"]
}

variable "ndp_redis_params" {
  type = object({
    capacity = number
    sku_name = string
    family   = string
  })
  default = {
    capacity = 0
    sku_name = "Basic"
    family   = "C"
  }
}


# CosmosDB
variable "cidr_subnet_cosmosdb_nodo_re" {
  type        = list(string)
  description = "Cosmos DB address space for nodo re."
}

variable "cosmos_nosql_db_params" {
  type = object({
    capabilities   = list(string)
    offer_type     = string
    server_version = string
    kind           = string
    consistency_policy = object({
      consistency_level       = string
      max_interval_in_seconds = number
      max_staleness_prefix    = number
    })
    main_geo_location_zone_redundant = bool
    enable_free_tier                 = bool
    additional_geo_locations = list(object({
      location          = string
      failover_priority = number
      zone_redundant    = bool
    }))
    private_endpoint_enabled          = bool
    public_network_access_enabled     = bool
    is_virtual_network_filter_enabled = bool
    backup_continuous_enabled         = bool
    events_ttl                        = number
    max_throughput                    = number
  })
}

# Nodo RE Storage Account

variable "nodo_re_storage_account" {
  type = object({
    account_kind                  = string
    account_tier                  = string
    account_replication_type      = string
    advanced_threat_protection    = bool
    blob_delete_retention_days    = number
    blob_versioning_enabled       = bool
    public_network_access_enabled = bool
    backup_enabled                = bool
    backup_retention              = optional(number, 0)
  })
  default = {
    account_kind                  = "StorageV2"
    account_tier                  = "Standard"
    account_replication_type      = "LRS"
    blob_versioning_enabled       = false
    advanced_threat_protection    = false
    blob_delete_retention_days    = 0
    public_network_access_enabled = false
    backup_enabled                = false
    backup_retention              = 0
  }
}

variable "nodo_storico_storage_account" {
  type = object({
    account_kind                  = string
    account_tier                  = string
    account_replication_type      = string
    advanced_threat_protection    = bool
    blob_versioning_enabled       = bool
    public_network_access_enabled = bool
    backup_enabled                = bool
    blob_delete_retention_days    = number
    backup_retention              = optional(number, 0)

  })
  default = {
    account_kind                  = "StorageV2"
    account_tier                  = "Standard"
    account_replication_type      = "LRS"
    blob_versioning_enabled       = false
    advanced_threat_protection    = true
    public_network_access_enabled = true
    backup_enabled                = false
    blob_delete_retention_days    = 0
    backup_retention              = 0

  }
}

variable "nodo_storico_allowed_ips" {
  type        = list(string)
  description = "List of public IP or IP ranges in CIDR Format allowed to access the storage account. Only IPV4 addresses are allowed"
  default     = []
}


variable "enable_sftp_backup" {
  type        = bool
  default     = false
  description = "(Optional) Enables nodo sftp storage account backup"
}

variable "sftp_sa_delete_retention_days" {
  type        = number
  default     = 0
  description = "(Optional) nodo sftp storage delete retention"
}

variable "sftp_sa_backup_retention_days" {
  type        = number
  default     = 0
  description = "(Optional) nodo sftp storage backup retention"
}

variable "enable_nodo_re" {
  type        = bool
  default     = false
  description = "Enables dumping nodo re"
}
