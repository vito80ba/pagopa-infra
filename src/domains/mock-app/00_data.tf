data "azurerm_resource_group" "rg_api" {
  name = format("%s-api-rg", local.product)
}

data "azurerm_api_management" "apim" {
  name                = "${local.product}-apim"
  resource_group_name = data.azurerm_resource_group.rg_api.name
}

data "azurerm_key_vault_secret" "mocker_db_user" {
  count        = var.env_short == "d" ? 1 : 0
  name         = "db-mocker-user-name"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "mocker_db_pwd" {
  count        = var.env_short == "d" ? 1 : 0
  name         = "db-mocker-user-pwd"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_postgresql_flexible_server" "postgresql" {
  count               = var.env_short == "d" ? 1 : 0
  name                = format("%s-mocker-pgflex", local.product)
  resource_group_name = format("%s-mock-rg", local.product)
}

data "azurerm_api_management_group" "group_developers" {
  name                = "developers"
  api_management_name = local.pagopa_apim_name
  resource_group_name = local.pagopa_apim_rg
}
