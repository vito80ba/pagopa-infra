##############
## Products ##
##############

module "apim_payment_wallet_product" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product?ref=v6.3.0"

  product_id   = "payment-wallet"
  display_name = "payment wallet pagoPA"
  description  = "Product for payment wallet pagoPA"

  api_management_name = local.pagopa_apim_name
  resource_group_name = local.pagopa_apim_rg

  published             = true
  subscription_required = true
  approval_required     = true
  subscriptions_limit   = 1000

  policy_xml = file("./api_product/_base_policy.xml")
}

#################################################
## API payment wallet for IO                   ##
#################################################
locals {
  apim_payment_wallet_api = {
    display_name          = "pagoPA - payment wallet API for IO APP"
    description           = "API to support payment wallet for IO APP"
    path                  = "payment-wallet"
    subscription_required = false
    service_url           = null
  }
}

# Payment wallet service APIs
resource "azurerm_api_management_api_version_set" "payment_wallet_api" {
  name                = "${local.project}-payment-wallet-api"
  resource_group_name = local.pagopa_apim_rg
  api_management_name = local.pagopa_apim_name
  display_name        = local.apim_payment_wallet_api.display_name
  versioning_scheme   = "Segment"
}

module "apim_payment_wallet_api_v1" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api?ref=v6.3.0"

  name                  = "${local.project}-payment-wallet-api"
  api_management_name   = local.pagopa_apim_name
  resource_group_name   = local.pagopa_apim_rg
  product_ids           = [module.apim_payment_wallet_product.product_id]
  subscription_required = local.apim_payment_wallet_api.subscription_required
  version_set_id        = azurerm_api_management_api_version_set.payment_wallet_api.id
  api_version           = "v1"

  description  = local.apim_payment_wallet_api.description
  display_name = local.apim_payment_wallet_api.display_name
  path         = local.apim_payment_wallet_api.path
  protocols    = ["https"]
  service_url  = local.apim_payment_wallet_api.service_url

  content_format = "openapi"
  content_value = templatefile("./api/payment-wallet/v1/_openapi.json.tpl", {
    hostname = local.apim_hostname
  })

  xml_content = templatefile("./api/payment-wallet/v1/_base_policy.xml.tpl", {
    hostname = local.wallet_hostname
  })
}

resource "azurerm_api_management_api_operation_policy" "post_wallets" {
  count               = var.payment_wallet_with_pm_enabled ? 1 : 0
  api_name            = "${local.project}-payment-wallet-api-v1"
  resource_group_name = local.pagopa_apim_rg
  api_management_name = local.pagopa_apim_name
  operation_id        = "createWallet"

  xml_content = templatefile("./api/payment-wallet/v1/_post_wallets_with_pm_policy.xml.tpl", {
    env = var.env
  })
}

resource "azurerm_api_management_api_operation_policy" "get_payment_methods" {
  api_name            = "${local.project}-payment-wallet-api-v1"
  resource_group_name = local.pagopa_apim_rg
  api_management_name = local.pagopa_apim_name
  operation_id        = "getAllPaymentMethods"

  xml_content = templatefile("./api/payment-wallet/v1/_get_payment_methods_policy.xml.tpl", { ecommerce_hostname = local.ecommerce_hostname }
  )
}

#################################################
## API wallet notifications service            ##
#################################################
locals {
  apim_wallet_notifications_service_api = {
    display_name          = "pagoPA - wallet notifications API"
    description           = "API to support wallet notifications service"
    path                  = "wallet-notifications-service"
    subscription_required = true
    service_url           = null
  }
}

# Wallet notifications service APIs
resource "azurerm_api_management_api_version_set" "wallet_notifications_service_api" {
  name                = "${local.project}-notifications-service-api"
  resource_group_name = local.pagopa_apim_rg
  api_management_name = local.pagopa_apim_name
  display_name        = local.apim_wallet_notifications_service_api.display_name
  versioning_scheme   = "Segment"
}

module "apim_wallet_service_notifications_api_v1" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api?ref=v6.3.0"

  name                  = "${local.project}-notifications-service-api"
  api_management_name   = local.pagopa_apim_name
  resource_group_name   = local.pagopa_apim_rg
  product_ids           = [module.apim_payment_wallet_product.product_id]
  subscription_required = local.apim_wallet_notifications_service_api.subscription_required
  version_set_id        = azurerm_api_management_api_version_set.wallet_notifications_service_api.id
  api_version           = "v1"

  description  = local.apim_wallet_notifications_service_api.description
  display_name = local.apim_wallet_notifications_service_api.display_name
  path         = local.apim_wallet_notifications_service_api.path
  protocols    = ["https"]
  service_url  = local.apim_wallet_notifications_service_api.service_url

  content_format = "openapi"
  content_value = templatefile("./api/npg/v1/_openapi.json.tpl", {
    hostname = local.apim_hostname
  })

  xml_content = templatefile("./api/npg/v1/_base_policy.xml.tpl", {
    hostname = local.wallet_hostname
  })
}