
resource "azurerm_resource_group" "shared_pdf_engine_app_service_rg" {
  name     = format("%s-pdf-engine-rg", local.project)
  location = var.location

  tags = var.tags
}

data "azurerm_container_registry" "container_registry" {
  name                = "pagopa${var.env_short}commonacr"
  resource_group_name = "pagopa-${var.env_short}-container-registry-rg"
}

################
# node
################

module "shared_pdf_engine_app_service" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//app_service?ref=v6.3.0"

  vnet_integration    = false
  resource_group_name = azurerm_resource_group.shared_pdf_engine_app_service_rg.name
  location            = var.location

  # App service plan vars
  plan_name = format("%s-plan-pdf-engine", local.project)
  plan_kind = "Linux"
  sku_name  = var.app_service_pdf_engine_sku_name

  # App service plan
  name                = format("%s-app-pdf-engine", local.project)
  client_cert_enabled = false
  always_on           = var.app_service_pdf_engine_always_on
  # linux_fx_version    = format("DOCKER|%s/pagopapdfengine:%s", data.azurerm_container_registry.container_registry.login_server, "latest")
  docker_image     = "${data.azurerm_container_registry.container_registry.login_server}/pagopapdfengine"
  docker_image_tag = "latest"

  health_check_path = "/info"

  app_settings = local.shared_pdf_engine_app_settings

  allowed_subnets = [data.azurerm_subnet.apim_vnet.id]
  allowed_ips     = []

  subnet_id = module.shared_pdf_engine_app_service_snet.id

  tags = var.tags
}

module "shared_pdf_engine_slot_staging" {
  count = var.env_short != "d" ? 1 : 0

  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//app_service_slot?ref=v6.6.0"

  # App service plan
  # app_service_plan_id = module.shared_pdf_engine_app_service.plan_id
  app_service_id   = module.shared_pdf_engine_app_service.id
  app_service_name = module.shared_pdf_engine_app_service.name

  # App service
  name                = "staging"
  resource_group_name = azurerm_resource_group.shared_pdf_engine_app_service_rg.name
  location            = var.location

  always_on = true
  # linux_fx_version    = format("DOCKER|%s/pagopapdfengine:%s", data.azurerm_container_registry.container_registry.login_server, "latest")
  docker_image      = "${data.azurerm_container_registry.container_registry.login_server}/pagopapdfengine"
  docker_image_tag  = "latest"
  health_check_path = "/info"


  # App settings
  app_settings = local.shared_pdf_engine_app_settings

  allowed_subnets = [data.azurerm_subnet.apim_vnet.id]
  allowed_ips     = []
  subnet_id       = module.shared_pdf_engine_app_service_snet.id

  tags = var.tags
}

resource "azurerm_monitor_autoscale_setting" "autoscale_app_service_shared_pdf_engine_autoscale" {
  count = var.env_short != "d" ? 1 : 0

  name                = format("%s-autoscale-pdf-engine", local.project)
  resource_group_name = azurerm_resource_group.shared_pdf_engine_app_service_rg.name
  location            = azurerm_resource_group.shared_pdf_engine_app_service_rg.location
  target_resource_id  = module.shared_pdf_engine_app_service.plan_id
  enabled             = var.app_service_pdf_engine_autoscale_enabled

  profile {
    name = "default"

    capacity {
      default = 3
      minimum = var.env_short == "p" ? 3 : 1
      maximum = 10
    }

    # Requests 
    rule {
      metric_trigger {
        metric_name              = "Requests"
        metric_resource_id       = module.shared_pdf_engine_app_service.id
        metric_namespace         = "microsoft.web/sites"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "GreaterThan"
        threshold                = 2000
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "2"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name              = "Requests"
        metric_resource_id       = module.shared_pdf_engine_app_service.id
        metric_namespace         = "microsoft.web/sites"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "LessThan"
        threshold                = 1000
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT20M"
      }
    }

    # HttpResponseTime 

    # Supported metrics for Microsoft.Web/sites 
    # 👀 https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-metrics/microsoft-web-sites-metrics
    rule {
      metric_trigger {
        metric_name              = "HttpResponseTime"
        metric_resource_id       = module.shared_pdf_engine_app_service.id
        metric_namespace         = "microsoft.web/sites"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "GreaterThan"
        threshold                = 5 #sec
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "2"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name              = "HttpResponseTime"
        metric_resource_id       = module.shared_pdf_engine_app_service.id
        metric_namespace         = "microsoft.web/sites"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "LessThan"
        threshold                = 2 #sec
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT20M"
      }
    }

    # CpuPercentage 

    # Supported metrics for Microsoft.Web/sites 
    # 👀 https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-metrics/microsoft-web-sites-metrics
    rule {
      metric_trigger {
        metric_name              = "CpuPercentage"
        metric_resource_id       = module.shared_pdf_engine_app_service.plan_id
        metric_namespace         = "microsoft.web/serverfarms"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "GreaterThan"
        threshold                = 75
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "2"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name              = "CpuPercentage"
        metric_resource_id       = module.shared_pdf_engine_app_service.plan_id
        metric_namespace         = "microsoft.web/serverfarms"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "LessThan"
        threshold                = 30 #sec
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT20M"
      }
    }


  }
}


################
# java
################
module "shared_pdf_engine_app_service_java" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//app_service?ref=v6.3.0"

  vnet_integration    = false
  resource_group_name = azurerm_resource_group.shared_pdf_engine_app_service_rg.name
  location            = var.location

  # App service plan vars
  plan_name = format("%s-plan-pdf-engine-java", local.project)
  plan_kind = "Linux"
  sku_name  = var.app_service_pdf_engine_sku_name_java

  # App service plan
  name                = format("%s-app-pdf-engine-java", local.project)
  client_cert_enabled = false
  always_on           = var.app_service_pdf_engine_always_on
  # linux_fx_version    = format("DOCKER|%s/pagopapdfengine:%s", data.azurerm_container_registry.container_registry.login_server, "latest")
  docker_image     = "${data.azurerm_container_registry.container_registry.login_server}/pagopapdfenginejava"
  docker_image_tag = "latest"

  health_check_path = "/info"

  app_settings = local.shared_pdf_engine_app_settings_java

  allowed_subnets = [data.azurerm_subnet.apim_vnet.id]
  allowed_ips     = []

  subnet_id = module.shared_pdf_engine_app_service_snet.id

  tags = var.tags
}

module "shared_pdf_engine_java_slot_staging" {
  count = var.env_short != "d" ? 1 : 0

  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//app_service_slot?ref=v6.6.0"

  # App service plan
  # app_service_plan_id = module.shared_pdf_engine_app_service.plan_id
  app_service_id   = module.shared_pdf_engine_app_service_java.id
  app_service_name = module.shared_pdf_engine_app_service_java.name

  # App service
  name                = "staging"
  resource_group_name = azurerm_resource_group.shared_pdf_engine_app_service_rg.name
  location            = var.location

  always_on = true
  # linux_fx_version    = format("DOCKER|%s/pagopapdfengine:%s", data.azurerm_container_registry.container_registry.login_server, "latest")
  docker_image      = "${data.azurerm_container_registry.container_registry.login_server}/pagopapdfenginejava"
  docker_image_tag  = "latest"
  health_check_path = "/info"


  # App settings
  app_settings = local.shared_pdf_engine_app_settings_java

  allowed_subnets = [data.azurerm_subnet.apim_vnet.id]
  allowed_ips     = []
  subnet_id       = module.shared_pdf_engine_app_service_snet.id

  tags = var.tags
}

resource "azurerm_monitor_autoscale_setting" "autoscale_app_service_shared_pdf_engine_java_autoscale" {
  count = var.env_short != "d" ? 1 : 0

  name                = format("%s-autoscale-pdf-engine-java", local.project)
  resource_group_name = azurerm_resource_group.shared_pdf_engine_app_service_rg.name
  location            = azurerm_resource_group.shared_pdf_engine_app_service_rg.location
  target_resource_id  = module.shared_pdf_engine_app_service_java.plan_id
  enabled             = var.app_service_pdf_engine_autoscale_enabled

  profile {
    name = "default"

    capacity {
      default = 3
      minimum = var.env_short == "p" ? 3 : 1
      maximum = 10
    }

    # Requests 
    rule {
      metric_trigger {
        metric_name              = "Requests"
        metric_resource_id       = module.shared_pdf_engine_app_service_java.id
        metric_namespace         = "microsoft.web/sites"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "GreaterThan"
        threshold                = 2000
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "2"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name              = "Requests"
        metric_resource_id       = module.shared_pdf_engine_app_service_java.id
        metric_namespace         = "microsoft.web/sites"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "LessThan"
        threshold                = 1000
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT20M"
      }
    }

    # HttpResponseTime 

    # Supported metrics for Microsoft.Web/sites 
    # 👀 https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-metrics/microsoft-web-sites-metrics
    rule {
      metric_trigger {
        metric_name              = "HttpResponseTime"
        metric_resource_id       = module.shared_pdf_engine_app_service_java.id
        metric_namespace         = "microsoft.web/sites"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "GreaterThan"
        threshold                = 5 #sec
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "2"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name              = "HttpResponseTime"
        metric_resource_id       = module.shared_pdf_engine_app_service_java.id
        metric_namespace         = "microsoft.web/sites"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "LessThan"
        threshold                = 2 #sec
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT20M"
      }
    }

    # CpuPercentage 

    # Supported metrics for Microsoft.Web/sites 
    # 👀 https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-metrics/microsoft-web-sites-metrics
    rule {
      metric_trigger {
        metric_name              = "CpuPercentage"
        metric_resource_id       = module.shared_pdf_engine_app_service_java.plan_id
        metric_namespace         = "microsoft.web/serverfarms"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "GreaterThan"
        threshold                = 75
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "2"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name              = "CpuPercentage"
        metric_resource_id       = module.shared_pdf_engine_app_service_java.plan_id
        metric_namespace         = "microsoft.web/serverfarms"
        time_grain               = "PT1M"
        statistic                = "Average"
        time_window              = "PT5M"
        time_aggregation         = "Average"
        operator                 = "LessThan"
        threshold                = 30 #sec
        divide_by_instance_count = false
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT20M"
      }
    }
  }
}

