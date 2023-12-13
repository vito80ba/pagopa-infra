##############
## Products ##
##############

module "apim_nodo_dei_pagamenti_product_auth" {
  source = "git::https://github.com/pagopa/azurerm.git//api_management_product?ref=v1.0.90"

  product_id   = "nodo-auth"
  display_name = "Nodo dei Pagamenti (Nuova Connettività)"
  description  = "Product for Nodo dei Pagamenti (Nuova Connettività)"

  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name

  published             = true
  subscription_required = true
  approval_required     = true
  subscriptions_limit   = var.nodo_auth_subscription_limit


  policy_xml = var.apim_nodo_auth_decoupler_enable ? templatefile("./api_product/nodo_pagamenti_api/decoupler/base_policy.xml.tpl", { # decoupler ON
    address-range-from       = var.env_short == "p" ? "10.1.128.0" : "0.0.0.0"
    address-range-to         = var.env_short == "p" ? "10.1.128.255" : "0.0.0.0"
    is-nodo-auth-pwd-replace = true
  }) : file("./api_product/nodo_pagamenti_api/auth/_base_policy.xml") # decoupler OFF
}

locals {

  api_nodo_product_auth = [
    azurerm_api_management_api.apim_node_for_psp_api_v1_auth.name,
    azurerm_api_management_api.apim_nodo_per_psp_api_v1_auth.name,
    azurerm_api_management_api.apim_node_for_io_api_v1_auth.name,
    azurerm_api_management_api.apim_nodo_per_pa_api_v1_auth.name,
    azurerm_api_management_api.apim_node_for_pa_api_v1_auth.name,
    azurerm_api_management_api.apim_nodo_per_psp_richiesta_avvisi_api_v1_auth.name
  ]

}

resource "azurerm_api_management_product_api" "apim_nodo_dei_pagamenti_product_api_auth" {
  for_each = toset(local.api_nodo_product_auth)

  api_name            = each.key
  product_id          = module.apim_nodo_dei_pagamenti_product_auth.product_id
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
}

## NAMED VALUE

resource "azurerm_api_management_named_value" "nodo_auth_password_value" {
  name                = "nodoAuthPassword"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "nodoAuthPassword"
  value               = var.nodo_pagamenti_auth_password
}

resource "azurerm_api_management_named_value" "x_forwarded_for_value" {
  name                = "xForwardedFor"
  api_management_name = module.apim.name
  resource_group_name = azurerm_resource_group.rg_api.name
  display_name        = "xForwardedFor"
  value               = var.nodo_pagamenti_x_forwarded_for
}