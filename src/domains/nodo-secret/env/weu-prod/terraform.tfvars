prefix          = "pagopa"
env_short       = "p"
env             = "prod"
domain          = "nodo"
location        = "westeurope"
location_short  = "weu"
location_string = "West Europe"
instance        = "prod"

tags = {
  CreatedBy   = "Terraform"
  Environment = "Prod"
  Owner       = "pagoPA"
  Source      = "https://github.com/pagopa/pagopa-infra/tree/main/src/domains/nodo-secret"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}

### External resources

monitor_resource_group_name                 = "pagopa-p-monitor-rg"
log_analytics_workspace_name                = "pagopa-p-law"
log_analytics_workspace_resource_group_name = "pagopa-p-monitor-rg"

input_file = "./secret/weu-prod/configs.json"

enable_iac_pipeline = true

az_nodo_sa_share_name_firmatore = "firmatore"
upload_firmatore = {
  "firmatore.zip" = "./env/weu-prod/resources/firmatore.zip"
}

cacerts_path = "./env/weu-prod/resources/cacerts"

pipe_service_principel_application_id  = "22dff46c-7e53-4e83-abeb-1d7e3bf72e53"
certs_storage_account_replication_type = "GZRS"
