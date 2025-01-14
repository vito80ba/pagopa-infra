# APIM subnet
module "apim_snet" {
  source               = "git::https://github.com/pagopa/azurerm.git//subnet?ref=v1.0.90"
  name                 = format("%s-apim-snet", local.project)
  resource_group_name  = azurerm_resource_group.rg_vnet.name
  virtual_network_name = module.vnet_integration.name
  address_prefixes     = var.cidr_subnet_apim

  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Web"]
}

resource "azurerm_resource_group" "rg_api" {
  name     = format("%s-api-rg", local.project)
  location = var.location

  tags = var.tags
}

locals {
  apim_cert_name_proxy_endpoint   = format("%s-proxy-endpoint-cert", local.project)
  portal_cert_name_proxy_endpoint = format("%s-proxy-endpoint-cert", "portal")

  api_domain        = format("api.%s.%s", var.dns_zone_prefix, var.external_domain)
  prf_domain        = format("api.%s.%s", var.dns_zone_prefix_prf, var.external_domain)
  portal_domain     = format("portal.%s.%s", var.dns_zone_prefix, var.external_domain)
  management_domain = format("management.%s.%s", var.dns_zone_prefix, var.external_domain)
}

###########################
## Api Management (apim) ##
###########################

module "apim" {
  source = "git::https://github.com/pagopa/azurerm.git//api_management?ref=v2.5.0"

  subnet_id            = module.apim_snet.id
  location             = azurerm_resource_group.rg_api.location
  name                 = format("%s-apim", local.project)
  resource_group_name  = azurerm_resource_group.rg_api.name
  publisher_name       = var.apim_publisher_name
  publisher_email      = data.azurerm_key_vault_secret.apim_publisher_email.value
  sku_name             = var.apim_sku
  virtual_network_type = "Internal"

  redis_connection_string = var.redis_cache_enabled ? module.redis.primary_connection_string : null
  redis_cache_id          = var.redis_cache_enabled ? module.redis.id : null

  # This enables the Username and Password Identity Provider
  sign_up_enabled = false

  lock_enable = false

  # sign_up_terms_of_service = {
  #   consent_required = false
  #   enabled          = false
  #   text             = ""
  # }

  application_insights_instrumentation_key = azurerm_application_insights.application_insights.instrumentation_key

  xml_content = templatefile("./api/base_policy.tpl", {
    portal-domain         = local.portal_domain
    management-api-domain = local.management_domain
    apim-name             = format("%s-apim", local.project)
  })

  autoscale = var.apim_autoscale

  alerts_enabled = var.apim_alerts_enabled

  action = [
    {
      action_group_id    = azurerm_monitor_action_group.slack.id
      webhook_properties = null
    },
    {
      action_group_id    = azurerm_monitor_action_group.email.id
      webhook_properties = null
    }
  ]

  # metrics docs
  # https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftapimanagementservice
  metric_alerts = {
    capacity = {
      description   = "Apim used capacity is too high"
      frequency     = "PT5M"
      window_size   = "PT5M"
      severity      = 1
      auto_mitigate = true

      criteria = [{
        metric_namespace       = "Microsoft.ApiManagement/service"
        metric_name            = "Capacity"
        aggregation            = "Average"
        operator               = "GreaterThan"
        threshold              = 50
        skip_metric_validation = false
        dimension              = []
      }]
      dynamic_criteria = []
    }

    duration = {
      description   = "Apim abnormal response time"
      frequency     = "PT5M"
      window_size   = "PT5M"
      severity      = 2
      auto_mitigate = true

      criteria = []

      dynamic_criteria = [{
        metric_namespace         = "Microsoft.ApiManagement/service"
        metric_name              = "Duration"
        aggregation              = "Average"
        operator                 = "GreaterThan"
        alert_sensitivity        = "High"
        evaluation_total_count   = 2
        evaluation_failure_count = 2
        skip_metric_validation   = false
        ignore_data_before       = "2021-01-01T00:00:00Z" # sample data
        dimension                = []
      }]
    }

    requests_failed = {
      description   = "Apim abnormal failed requests"
      frequency     = "PT5M"
      window_size   = "PT5M"
      severity      = 2
      auto_mitigate = true

      criteria = []

      dynamic_criteria = [{
        metric_namespace         = "Microsoft.ApiManagement/service"
        metric_name              = "Requests"
        aggregation              = "Total"
        operator                 = "GreaterThan"
        alert_sensitivity        = "High"
        evaluation_total_count   = 2
        evaluation_failure_count = 2
        skip_metric_validation   = false
        ignore_data_before       = "2021-01-01T00:00:00Z" # sample data
        dimension = [{
          name     = "BackendResponseCode"
          operator = "Include"
          values   = ["5xx"]
        }]
      }]
    }
  }

  tags = var.tags

  depends_on = [
    azurerm_application_insights.application_insights
  ]
}


resource "azurerm_api_management_group" "readonly" {
  name                = "read-only"
  resource_group_name = azurerm_resource_group.rg_api.name
  api_management_name = module.apim.name
  display_name        = "Read Only"
}

resource "azurerm_api_management_group" "checkout_rate_no_limit" {
  name                = "checkout-rate-no-limit"
  resource_group_name = azurerm_resource_group.rg_api.name
  api_management_name = module.apim.name
  display_name        = "Checkout rate no limit"
}

resource "azurerm_api_management_group" "checkout_rate_limit_300" {
  name                = "checkout-rate-limit-300"
  resource_group_name = azurerm_resource_group.rg_api.name
  api_management_name = module.apim.name
  display_name        = "Checkout rate limit 300"
}

resource "azurerm_api_management_group" "client_io" {
  name                = "client-io"
  resource_group_name = azurerm_resource_group.rg_api.name
  api_management_name = module.apim.name
  display_name        = "Client IO"
}

resource "azurerm_api_management_group" "centro_stella" {
  name                = "centro-stella"
  resource_group_name = azurerm_resource_group.rg_api.name
  api_management_name = module.apim.name
  display_name        = "Centro Stella"
}

resource "azurerm_api_management_group" "piattaforma_notifiche" {
  name                = "piattaforma-notifiche"
  resource_group_name = azurerm_resource_group.rg_api.name
  api_management_name = module.apim.name
  display_name        = "Piattaforma notifiche"
}

resource "azurerm_api_management_group" "payment_manager" {
  name                = "payment-manager"
  resource_group_name = azurerm_resource_group.rg_api.name
  api_management_name = module.apim.name
  display_name        = "Payment Manager"
}

resource "azurerm_api_management_group" "ecommerce" {
  name                = "ecommerce"
  resource_group_name = azurerm_resource_group.rg_api.name
  api_management_name = module.apim.name
  display_name        = "Ecommerce pagoPA"
}

resource "azurerm_api_management_group" "pda" {
  name                = "client-pda"
  resource_group_name = azurerm_resource_group.rg_api.name
  api_management_name = module.apim.name
  display_name        = "Client PDA"
}
resource "azurerm_api_management_group" "gps_grp" {
  name                = "gps-spontaneous-payments"
  resource_group_name = azurerm_resource_group.rg_api.name
  api_management_name = module.apim.name
  display_name        = "GPS Spontaneous Payments for ECs"
}
resource "azurerm_api_management_group" "afm_calculator" {
  name                = "afm-calculator"
  resource_group_name = azurerm_resource_group.rg_api.name
  api_management_name = module.apim.name
  display_name        = "AFM Calculator for Node"
}

resource "azurerm_api_management_named_value" "pagopa_fn_checkout_url_value" {
  count               = var.checkout_enabled ? 1 : 0
  name                = "pagopa-fn-checkout-url"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "pagopa-fn-checkout-url"
  value               = format("https://pagopa-%s-fn-checkout.azurewebsites.net", var.env_short)
}

resource "azurerm_api_management_named_value" "brokerlist_value" {
  name                = "brokerlist"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "brokerlist"
  value               = var.nodo_pagamenti_psp
}

resource "azurerm_api_management_named_value" "ecblacklist_value" {
  name                = "ecblacklist"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "ecblacklist"
  value               = var.nodo_pagamenti_ec
}

resource "azurerm_api_management_named_value" "urlnodo_value" {
  name                = "urlnodo"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "urlnodo"
  value               = var.nodo_pagamenti_url
}

resource "azurerm_api_management_named_value" "ip_nodo_value" { # TEMP used only for onPrem shall be replace with "aks_lb_nexi"
  name                = "ip-nodo"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "ip-nodo"
  value               = var.ip_nodo
}

resource "azurerm_api_management_named_value" "aks_lb_nexi" {
  name                = "aks-lb-nexi"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "aks-lb-nexi"
  value               = var.lb_aks
}

resource "azurerm_api_management_named_value" "base_path_nodo_oncloud" {
  name                = "base-path-nodo-oncloud"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-nodo-oncloud"
  value               = var.base_path_nodo_oncloud
}

# 1. PPT LMI
resource "azurerm_api_management_named_value" "base_path_nodo_ppt_lmi" {
  name                = "base-path-ppt-lmi"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-ppt-lmi"
  value               = var.base_path_nodo_ppt_lmi
}
resource "azurerm_api_management_named_value" "base_path_nodo_ppt_lmi_dev" {
  name                = "base-path-ppt-lmi-dev"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-ppt-lmi-dev"
  value               = var.base_path_nodo_ppt_lmi_dev
}

# 2. SYNC
resource "azurerm_api_management_named_value" "base_path_nodo_sync" {
  name                = "base-path-sync"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-sync"
  value               = var.base_path_nodo_sync
}
resource "azurerm_api_management_named_value" "base_path_nodo_sync_dev" {
  name                = "base-path-sync-dev"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-sync-dev"
  value               = var.base_path_nodo_sync_dev
}

# 3. WFESP
resource "azurerm_api_management_named_value" "base_path_nodo_wfesp" {
  name                = "base-path-wfesp"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-wfesp"
  value               = var.base_path_nodo_wfesp
}
resource "azurerm_api_management_named_value" "base_path_nodo_wfesp_dev" {
  name                = "base-path-wfesp-dev"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-wfesp-dev"
  value               = var.base_path_nodo_wfesp_dev
}

# 4. Fatturazione
resource "azurerm_api_management_named_value" "base_path_nodo_fatturazione" {
  name                = "base-path-fatturazione"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-fatturazione"
  value               = var.base_path_nodo_fatturazione
}
resource "azurerm_api_management_named_value" "base_path_nodo_fatturazione_dev" {
  name                = "base-path-fatturazione-dev"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-fatturazione-dev"
  value               = var.base_path_nodo_fatturazione_dev
}

# 5. Web-BO
resource "azurerm_api_management_named_value" "base_path_nodo_web_bo" {
  name                = "base-path-web-bo"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-web-bo"
  value               = var.base_path_nodo_web_bo
}
resource "azurerm_api_management_named_value" "base_path_nodo_web_bo_dev" {
  name                = "base-path-web-bo-dev"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-web-bo-dev"
  value               = var.base_path_nodo_web_bo_dev
}

# 6. Web-BO History
resource "azurerm_api_management_named_value" "base_path_nodo_web_bo_history" {
  name                = "base-path-web-bo-history"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-web-bo-history"
  value               = var.base_path_nodo_web_bo_history
}
resource "azurerm_api_management_named_value" "base_path_nodo_web_bo_history_dev" {
  name                = "base-path-web-bo-history-dev"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "base-path-web-bo-history-dev"
  value               = var.base_path_nodo_web_bo_history_dev
}

resource "azurerm_api_management_named_value" "pagopa_fn_checkout_key" {
  count               = var.checkout_enabled ? 1 : 0
  name                = "pagopa-fn-checkout-key"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "pagopa-fn-checkout-key"
  value               = data.azurerm_key_vault_secret.fn_checkout_key.value
  secret              = true
}

resource "azurerm_api_management_named_value" "checkout_google_recaptcha_secret" {
  name                = "google-recaptcha-secret"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "google-recaptcha-secret"
  value               = data.azurerm_key_vault_secret.google_recaptcha_secret.value
  secret              = true
}

resource "azurerm_api_management_named_value" "pagopa_fn_buyerbanks_url_value" {
  name                = "pagopa-fn-buyerbanks-url"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "pagopa-fn-buyerbanks-url"
  value               = format("https://pagopa-%s-fn-buyerbanks.azurewebsites.net", var.env_short)
}


resource "azurerm_api_management_named_value" "pagopa_fn_buyerbanks_key" {
  name                = "pagopa-fn-buyerbanks-key"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "pagopa-fn-buyerbanks-key"
  value               = data.azurerm_key_vault_secret.fn_buyerbanks_key.value
  secret              = true
}

resource "azurerm_api_management_named_value" "pm_gtw_hostname" {
  name                = "pm-gtw-hostname"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "pm-gtw-hostname"
  value               = data.azurerm_key_vault_secret.pm_gtw_hostname.value
  secret              = true
}

resource "azurerm_api_management_named_value" "pm_onprem_hostname" {
  name                = "pm-onprem-hostname"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "pm-onprem-hostname"
  value               = data.azurerm_key_vault_secret.pm_onprem_hostname.value
  secret              = true
}

resource "azurerm_api_management_named_value" "pm_host" {
  name                = "pm-host"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "pm-host"
  value               = data.azurerm_key_vault_secret.pm_host.value
  secret              = true
}

resource "azurerm_api_management_named_value" "pm_host_prf" {
  name                = "pm-host-prf"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "pm-host-prf"
  value               = data.azurerm_key_vault_secret.pm_host_prf.value
  secret              = true
}

resource "azurerm_api_management_named_value" "wisp2_gov_it" {
  name                = "wisp2-gov-it"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "wisp2-gov-it"
  value               = "${var.dns_zone_wisp2}.pagopa.gov.it"
}

resource "azurerm_api_management_named_value" "wisp2_it" {
  name                = "wisp2-it"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "wisp2-it"
  value               = "${var.dns_zone_wisp2}.${var.external_domain}"
}

# fdr
resource "azurerm_api_management_named_value" "fdrsaname" {
  name                = "fdrsaname"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "fdrsaname"
  value               = module.fdr_flows_sa.name
}

resource "azurerm_api_management_named_value" "fdrcontainername" {
  name                = "fdrcontainername"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "fdrcontainername"
  value               = azurerm_storage_container.fdr_rend_flow.name
}

data "azurerm_key_vault_secret" "mock_services_api_key" {
  count        = var.env_short == "d" ? 1 : 0
  name         = "mock-services-api-key"
  key_vault_id = module.key_vault.id
}

resource "azurerm_api_management_named_value" "pagopa_mock_services_api_key" {
  count               = var.env_short == "d" ? 1 : 0
  name                = "pagopa-mock-services-api-key"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "pagopa-mock-services-api-key"
  value               = data.azurerm_key_vault_secret.mock_services_api_key[0].value
  secret              = true
}

data "azurerm_key_vault_secret" "user_pm_test_key" {
  count        = var.env_short == "d" ? 1 : 0
  name         = "user-pm-test"
  key_vault_id = module.key_vault.id
}

resource "azurerm_api_management_named_value" "user_pm_test" {
  count               = var.env_short == "d" ? 1 : 0
  name                = "user-pm-test"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "user-pm-test"
  value               = data.azurerm_key_vault_secret.user_pm_test_key[0].value
  secret              = true
}

data "azurerm_key_vault_secret" "password_pm_test_key" {
  count        = var.env_short == "d" ? 1 : 0
  name         = "password-pm-test"
  key_vault_id = module.key_vault.id
}

resource "azurerm_api_management_named_value" "password_pm_test" {
  count               = var.env_short == "d" ? 1 : 0
  name                = "password-pm-test"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "password-pm-test"
  value               = data.azurerm_key_vault_secret.password_pm_test_key[0].value
  secret              = true
}

data "azurerm_key_vault_secret" "checkout_v2_test_key_secret" {
  count        = var.env_short == "d" ? 1 : 0
  name         = "checkout-v2-testing-api-key"
  key_vault_id = module.key_vault.id
}

resource "azurerm_api_management_named_value" "checkout_v2_test_key" {
  count               = var.env_short == "d" ? 1 : 0
  name                = "checkout-v2-testing-api-key"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "checkout-v2-testing-api-key"
  value               = data.azurerm_key_vault_secret.checkout_v2_test_key_secret[0].value
  secret              = true
}

# verificatore keys for apiconfig ( ottimizzazione ecs )

data "azurerm_key_vault_secret" "verificatore_key_secret_apiconfig" {
  name         = "verificatore-api-key-apiconfig"
  key_vault_id = module.key_vault.id
}

resource "azurerm_api_management_named_value" "verificatore_api_key_apiconfig" {
  name                = "verificatore-api-key-apiconfig"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "verificatore-api-key-apiconfig"
  value               = data.azurerm_key_vault_secret.verificatore_key_secret_apiconfig.value
  secret              = true
}


# donazioni
resource "azurerm_api_management_named_value" "donazioni_config_name" {
  name                = "donazioni-ucraina"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "donazioni-ucraina"
  value               = file(format("./api/nodopagamenti_api/paForNode/v1/donationsCfg/%s/donazioni_ucraina.json", var.env_short == "d" ? "dev" : var.env_short == "u" ? "uat" : "prod"))
}

resource "azurerm_api_management_named_value" "donazioni_config_name_2" {
  name                = "donazioni-ucraina2"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "donazioni-ucraina2"
  value               = file(format("./api/nodopagamenti_api/paForNode/v1/donationsCfg/%s/donazioni_ucraina2.json", var.env_short == "d" ? "dev" : var.env_short == "u" ? "uat" : "prod"))
}

resource "azurerm_api_management_custom_domain" "api_custom_domain" {
  api_management_id = module.apim.id

  proxy {
    host_name = local.api_domain
    key_vault_id = replace(
      data.azurerm_key_vault_certificate.app_gw_platform.secret_id,
      "/${data.azurerm_key_vault_certificate.app_gw_platform.version}",
      ""
    )
  }

  developer_portal {
    host_name = local.portal_domain
    key_vault_id = replace(
      data.azurerm_key_vault_certificate.portal_platform.secret_id,
      "/${data.azurerm_key_vault_certificate.portal_platform.version}",
      ""
    )
  }

  management {
    host_name = local.management_domain
    key_vault_id = replace(
      data.azurerm_key_vault_certificate.management_platform.secret_id,
      "/${data.azurerm_key_vault_certificate.management_platform.version}",
      ""
    )
  }

  dynamic "proxy" {
    for_each = var.env_short == "u" ? [""] : []
    content {
      host_name = local.prf_domain
      key_vault_id = replace(
        data.azurerm_key_vault_certificate.app_gw_platform_prf[0].secret_id,
        "/${data.azurerm_key_vault_certificate.app_gw_platform_prf[0].version}",
        ""
      )
    }
  }
}

#########
## API ##
#########

## monitor ##
module "monitor" {
  source              = "git::https://github.com/pagopa/azurerm.git//api_management_api?ref=v1.0.90"
  name                = format("%s-monitor", var.env_short)
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name

  description  = "Monitor"
  display_name = "Monitor"
  path         = ""
  protocols    = ["https"]

  service_url = null

  content_format = "openapi"
  content_value = templatefile("./api/monitor/openapi.json.tpl", {
    host = azurerm_api_management_custom_domain.api_custom_domain.proxy[0].host_name
  })

  xml_content = file("./api/base_policy.xml")

  subscription_required = false

  api_operation_policies = [
    {
      operation_id = "get"
      xml_content  = file("./api/monitor/mock_policy.xml")
    }
  ]
}
