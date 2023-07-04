module "apim_mocker_core_product" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_product?ref=v5.1.0"

  product_id   = local.mocker_core_api_locals.product_id
  display_name = local.mocker_core_api_locals.display_name
  description  = local.mocker_core_api_locals.description

  api_management_name = local.pagopa_apim_name
  resource_group_name = local.pagopa_apim_rg

  published             = true
  subscription_required = local.mocker_core_api_locals.subscription_required
  approval_required     = false
  subscriptions_limit   = local.mocker_core_api_locals.subscription_limit

  policy_xml = file("./api_product/v1/_base_policy.xml")
}

resource "azurerm_api_management_product_group" "access_control_developers_for_mocker_role" {
  product_id          = module.apim_mocker_core_product.product_id
  group_name          = data.azurerm_api_management_group.group_developers.name
  api_management_name = local.pagopa_apim_name
  resource_group_name = local.pagopa_apim_rg
}