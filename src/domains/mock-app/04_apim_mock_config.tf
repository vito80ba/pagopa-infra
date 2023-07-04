resource "azurerm_api_management_api_version_set" "mock_config_api" {

  name                = format("%s-mock-config-api", var.env_short)
  resource_group_name = local.pagopa_apim_rg
  api_management_name = local.pagopa_apim_name
  display_name        = local.mock_config_api_locals.display_name
  versioning_scheme   = "Segment"
}

module "apim_mock_config_api_v1" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//api_management_api?ref=v6.7.0"

  name                  = format("%s-mock-config-api", var.env_short)
  api_management_name   = local.pagopa_apim_name
  resource_group_name   = local.pagopa_apim_rg
  product_ids           = [module.apim_mock_config_product.product_id]
  subscription_required = local.mock_config_api_locals.subscription_required

  version_set_id = azurerm_api_management_api_version_set.mock_config_api.id
  api_version    = "v1"

  description  = local.mock_config_api_locals.description
  display_name = local.mock_config_api_locals.display_name
  path         = local.mock_config_api_locals.path
  protocols    = ["https"]

  service_url = local.mock_config_api_locals.service_url

  content_format = "openapi"
  content_value = templatefile("./api/mock-config/v1/_openapi.json.tpl", {
    host    = local.apim_hostname
  })

  xml_content = templatefile("./api/mock-config/v1/_base_policy.xml", {
    hostname = local.mock_hostname
  })
}

resource "azurerm_api_management_group" "api_mock_config_group" {
  name                = local.mock_config_api_locals.product_id
  resource_group_name = local.pagopa_apim_rg
  api_management_name = local.pagopa_apim_name
  display_name        = local.mock_config_api_locals.display_name
  description         = local.mock_config_api_locals.description
}
