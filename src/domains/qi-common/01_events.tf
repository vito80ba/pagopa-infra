data "azurerm_eventhub_authorization_rule" "pagopa-evh-ns02_quality-improvement-alerts_pagopa-qi-alert-rx" {
  name                = "${var.prefix}-qi-alert-rx"
  namespace_name      = "${local.product}-evh-ns02"
  eventhub_name       = "quality-improvement-alerts"
  resource_group_name = "${local.product}-msg-rg"
}

data "azurerm_eventhub_authorization_rule" "pagopa-evh-ns02_quality-improvement-alerts_pagopa-qi-alert-tx" {
  name                = "${var.prefix}-qi-alert-tx"
  namespace_name      = "${local.product}-evh-ns02"
  eventhub_name       = "quality-improvement-alerts"
  resource_group_name = "${local.product}-msg-rg"
}

data "azurerm_eventhub_authorization_rule" "pagopa-evh-ns02_quality-improvement-alerts_pagopa-qi-alert-rx-pdnd" {
  name                = "${var.prefix}-qi-alert-rx-pdnd"
  namespace_name      = "${local.product}-evh-ns02"
  eventhub_name       = "quality-improvement-alerts"
  resource_group_name = "${local.product}-msg-rg"
}

data "azurerm_eventhub_authorization_rule" "pagopa-evh-ns02_quality-improvement-alerts_pagopa-qi-alert-rx-debug" {
  name                = "${var.prefix}-qi-alert-rx-debug"
  namespace_name      = "${local.product}-evh-ns02"
  eventhub_name       = "quality-improvement-alerts"
  resource_group_name = "${local.product}-msg-rg"
}

