# info for event hub
data "azurerm_eventhub_authorization_rule" "pagopa-evh-ns01_nodo-dei-pagamenti-re_nodo-dei-pagamenti-re-to-tablestorage-rx" {
  name                = "nodo-dei-pagamenti-re-to-tablestorage-rx"
  namespace_name      = "${local.product}-evh-ns01"
  eventhub_name       = "nodo-dei-pagamenti-re"
  resource_group_name = "${local.product}-msg-rg"
}

# info for table storage
data "azurerm_storage_account" "nodo_re_storage" {
  name                = replace(format("%s-re-2-data-st", local.project), "-", "")
  resource_group_name = "pagopa-${var.env_short}-weu-nodo-re-to-datastore-rg"
}

locals {
  function_re_to_tablestorage_app_settings = {
    linux_fx_version               = "JAVA|11"
    FUNCTIONS_WORKER_RUNTIME       = "java"
    FUNCTIONS_WORKER_PROCESS_COUNT = 4
    // Keepalive fields are all optionals
    FETCH_KEEPALIVE_ENABLED             = "true"
    FETCH_KEEPALIVE_SOCKET_ACTIVE_TTL   = "110000"
    FETCH_KEEPALIVE_MAX_SOCKETS         = "40"
    FETCH_KEEPALIVE_MAX_FREE_SOCKETS    = "10"
    FETCH_KEEPALIVE_FREE_SOCKET_TIMEOUT = "30000"
    FETCH_KEEPALIVE_TIMEOUT             = "60000"

    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    WEBSITE_ENABLE_SYNC_UPDATE_SITE     = true

    DOCKER_REGISTRY_SERVER_URL = local.ts_docker_settings.DOCKER_REGISTRY_SERVER_URL

    EVENTHUB_CONN_STRING = data.azurerm_eventhub_authorization_rule.pagopa-evh-ns01_nodo-dei-pagamenti-re_nodo-dei-pagamenti-re-to-tablestorage-rx.primary_connection_string

    TABLE_STORAGE_CONN_STRING = data.azurerm_storage_account.nodo_re_storage.primary_connection_string
    TABLE_STORAGE_TABLE_NAME  = "events"
  }

  ts_docker_settings = {
    IMAGE_NAME = "pagopa/pagopa-nodo-re-to-tablestorage"
    # ghcr
    DOCKER_REGISTRY_SERVER_URL = "ghcr.io"
  }
}

## Function nodo_re_to_tablestorage
module "nodo_re_to_tablestorage_function" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app?ref=v6.20.0"

  resource_group_name = azurerm_resource_group.nodo_re_to_datastore_rg.name
  name                = "${local.project}-re-ts-fn"

  location          = var.location
  health_check_path = "/info"
  subnet_id         = module.nodo_re_to_tablestorage_function_snet.id
  runtime_version   = "~4"

  system_identity_enabled = true

  always_on = var.nodo_re_to_tablestorage_function.always_on

  application_insights_instrumentation_key = data.azurerm_application_insights.application_insights.instrumentation_key

  docker = {
    image_name        = local.ts_docker_settings.IMAGE_NAME
    image_tag         = var.nodo_re_to_tablestorage_function_app_image_tag
    registry_url      = local.ts_docker_settings.DOCKER_REGISTRY_SERVER_URL
    registry_username = null
    registry_password = null
  }

  client_certificate_mode = "Optional"

  cors = {
    allowed_origins = []
  }

  app_service_plan_name = "${local.project}-re-to-tablestorage-plan"
  app_service_plan_info = {
    kind                         = var.nodo_re_to_tablestorage_function.kind
    sku_size                     = var.nodo_re_to_tablestorage_function.sku_size
    maximum_elastic_worker_count = var.nodo_re_to_tablestorage_function.maximum_elastic_worker_count
    worker_count                 = 1
    zone_balancing_enabled       = false
  }

  storage_account_name = replace("${local.project}-re-2-ts-fn-sa", "-", "")
  storage_account_info = {
    account_kind                      = "StorageV2"
    account_tier                      = "Standard"
    account_replication_type          = var.app_service_storage_account_replication_type
    access_tier                       = "Hot"
    advanced_threat_protection_enable = true
  }

  app_settings = local.function_re_to_tablestorage_app_settings

  allowed_subnets = [data.azurerm_subnet.apim_vnet.id]
  allowed_ips     = []

  tags = var.tags
}

module "nodo_re_to_tablestorage_function_slot_staging" {
  count = var.env_short == "p" ? 1 : 0

  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//function_app_slot?ref=v6.9.0"

  app_service_plan_id                      = module.nodo_re_to_tablestorage_function.app_service_plan_id
  function_app_id                          = module.nodo_re_to_tablestorage_function.id
  storage_account_name                     = module.nodo_re_to_tablestorage_function.storage_account_name
  storage_account_access_key               = module.nodo_re_to_tablestorage_function.storage_account.primary_access_key
  name                                     = "staging"
  resource_group_name                      = azurerm_resource_group.nodo_re_to_datastore_rg.name
  location                                 = var.location
  application_insights_instrumentation_key = data.azurerm_application_insights.application_insights.instrumentation_key
  always_on                                = var.nodo_re_to_tablestorage_function.always_on
  health_check_path                        = "/info"
  runtime_version                          = "~4"
  subnet_id                                = module.nodo_re_to_tablestorage_function_snet.id

  # App settings
  app_settings = local.function_re_to_tablestorage_app_settings

  docker = {
    image_name        = local.ts_docker_settings.IMAGE_NAME
    image_tag         = var.nodo_re_to_tablestorage_function_app_image_tag
    registry_url      = local.ts_docker_settings.DOCKER_REGISTRY_SERVER_URL
    registry_username = null
    registry_password = null
  }

  allowed_subnets = [data.azurerm_subnet.apim_vnet.id]
  allowed_ips     = []

  tags = var.tags
}

resource "azurerm_monitor_autoscale_setting" "nodo_re_to_tablestorage_function" {
  count               = var.env_short == "p" ? 1 : 0
  name                = "${module.nodo_re_to_tablestorage_function.name}-autoscale"
  resource_group_name = azurerm_resource_group.nodo_re_to_datastore_rg.name
  location            = var.location
  target_resource_id  = module.nodo_re_to_tablestorage_function.app_service_plan_id

  profile {
    name = "default"

    capacity {
      default = var.nodo_re_to_tablestorage_function_autoscale.default
      minimum = var.nodo_re_to_tablestorage_function_autoscale.minimum
      maximum = var.nodo_re_to_tablestorage_function_autoscale.maximum
    }

    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = module.nodo_re_to_tablestorage_function.app_service_plan_id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = module.nodo_re_to_tablestorage_function.app_service_plan_id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 30
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}
