prefix         = "pagopa"
env_short      = "p"
env            = "prod"
domain         = "nodo"
location       = "westeurope"
location_short = "weu"
instance       = "prod"

tags = {
  CreatedBy   = "Terraform"
  Environment = "Prod"
  Owner       = "pagoPA"
  Source      = "https://github.com/pagopa/pagopa-infra/tree/main/src/domains/nodo-common"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}

### External resources

monitor_resource_group_name                 = "pagopa-p-monitor-rg"
log_analytics_workspace_name                = "pagopa-p-law"
log_analytics_workspace_resource_group_name = "pagopa-p-monitor-rg"

### Aks

ingress_load_balancer_ip = "10.1.100.250"

external_domain          = "pagopa.it"
dns_zone_internal_prefix = "internal.platform"

## CIDR nodo per database pgsql
cidr_subnet_flex_dbms = ["10.1.160.0/24"]

## CIDR storage subnet
cidr_subnet_storage_account = ["10.1.137.16/29"]


pgres_flex_params = {

  enabled    = true
  sku_name   = "GP_Standard_D8s_v3"
  db_version = "13"
  # Possible values are 32768, 65536, 131072, 262144, 524288, 1048576,
  # 2097152, 4194304, 8388608, 16777216, and 33554432.
  storage_mb                             = 32768
  zone                                   = 1
  backup_retention_days                  = 7
  geo_redundant_backup_enabled           = false
  create_mode                            = "Default"
  pgres_flex_private_endpoint_enabled    = true
  pgres_flex_ha_enabled                  = true
  pgres_flex_pgbouncer_enabled           = true
  pgres_flex_diagnostic_settings_enabled = true
  max_connections                        = 3400
}

sftp_account_replication_type = "LRS"
sftp_enable_private_endpoint  = true
sftp_ip_rules                 = [] # List of public IP or IP ranges in CIDR Format allowed to access the storage account. Only IPV4 addresses are allowed
