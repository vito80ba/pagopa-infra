prefix          = "pagopa"
env_short       = "p"
env             = "prod"
domain          = "selfcare"
location        = "westeurope"
location_short  = "weu"
location_string = "West Europe"
instance        = "prod"

tags = {
  CreatedBy   = "Terraform"
  Environment = "Prod"
  Owner       = "IO"
  Source      = "https://github.com/pagopa/pagopa-infra/tree/main/src/selfcare"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}

### External resources

monitor_resource_group_name                 = "pagopa-p-monitor-rg"
log_analytics_workspace_name                = "pagopa-p-law"
log_analytics_workspace_resource_group_name = "pagopa-p-monitor-rg"

external_domain          = "pagopa.it"
dns_zone_internal_prefix = "internal.platform"
apim_dns_zone_prefix     = "platform"

# chart releases: https://github.com/pagopa/aks-microservice-chart-blueprint/releases
# image tags: https://github.com/pagopa/infra-ssl-check/releases
tls_cert_check_helm = {
  chart_version = "1.21.0"
  image_name    = "ghcr.io/pagopa/infra-ssl-check"
  image_tag     = "v1.2.2@sha256:22f4b53177cc8891bf10cbd0deb39f60e1cd12877021c3048a01e7738f63e0f9"
}

selfcare_fe_enabled               = true
robots_indexed_paths              = []
selfcare_storage_replication_type = "GZRS"
