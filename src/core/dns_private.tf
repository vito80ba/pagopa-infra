# Private DNS zone: nodo dei pagamenti

resource "azurerm_private_dns_zone" "db_nodo_dns_zone" {
  name                = var.private_dns_zone_db_nodo_pagamenti
  resource_group_name = azurerm_resource_group.data.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "db_nodo_dns_zone_virtual_link" {
  name                  = "${local.project}-db_nodo-private-dns-zone-link"
  resource_group_name   = azurerm_resource_group.data.name
  private_dns_zone_name = azurerm_private_dns_zone.db_nodo_dns_zone.name
  virtual_network_id    = module.vnet_integration.id

  tags = var.tags
}

resource "azurerm_private_dns_a_record" "private_dns_a_record_db_nodo" {
  name                = "db-nodo-pagamenti"
  zone_name           = azurerm_private_dns_zone.db_nodo_dns_zone.name
  resource_group_name = azurerm_resource_group.data.name
  ttl                 = 60
  records             = var.dns_a_reconds_dbnodo_ips
}

# Private dns zone: redis

resource "azurerm_private_dns_zone" "privatelink_redis_cache_windows_net" {
  count               = var.redis_private_endpoint_enabled ? 1 : 0
  name                = "privatelink.redis.cache.windows.net"
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_redis_cache_windows_net_vnet" {
  count                 = var.redis_private_endpoint_enabled ? 1 : 0
  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_redis_cache_windows_net[0].name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false

  tags = var.tags
}

# Private dns zone: storage queue

resource "azurerm_private_dns_zone" "privatelink_queue_core_windows_net" {
  count = var.storage_queue_private_endpoint_enabled ? 1 : 0

  name                = "privatelink.queue.core.windows.net"
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link_privatelink_queue_core_windows_net" {
  count = var.storage_queue_private_endpoint_enabled ? 1 : 0

  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_queue_core_windows_net[0].name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false

  tags = var.tags
}

# DNS private 👉 <prod|uat|dev>.platform.pagopa.it
resource "azurerm_private_dns_zone" "platform_private_dns_zone" {
  name                = "${var.dns_zone_prefix}.${var.external_domain}"
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

resource "azurerm_private_dns_a_record" "platform_dns_a_private_apim" {

  for_each            = toset(var.platform_private_dns_zone_records)
  name                = each.key
  zone_name           = azurerm_private_dns_zone.platform_private_dns_zone.name
  resource_group_name = azurerm_resource_group.rg_vnet.name
  ttl                 = var.dns_default_ttl_sec
  records             = module.apim.private_ip_addresses
  tags                = var.tags
}

resource "azurerm_private_dns_cname_record" "config_platform_dns_private_cname" {

  name                = "config"
  zone_name           = azurerm_private_dns_zone.platform_private_dns_zone.name
  resource_group_name = azurerm_resource_group.rg_vnet.name
  ttl                 = var.dns_default_ttl_sec
  record              = module.api_config_fe_cdn[0].hostname
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "platform_vnetlink_vnet" {
  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.platform_private_dns_zone.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "platform_vnetlink_vnet_integration" {
  name                  = module.vnet_integration.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.platform_private_dns_zone.name
  virtual_network_id    = module.vnet_integration.id
  registration_enabled  = false

  tags = var.tags
}

# DNS private 👉 prf.platform.pagopa.it

resource "azurerm_private_dns_zone" "platform_private_dns_zone_prf" {
  count               = var.env_short == "u" ? 1 : 0
  name                = format("%s.%s", var.dns_zone_prefix_prf, var.external_domain)
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

resource "azurerm_private_dns_a_record" "platform_dns_a_private_prf" {
  count               = var.env_short == "u" ? 1 : 0
  name                = "api"
  zone_name           = azurerm_private_dns_zone.platform_private_dns_zone_prf[0].name
  resource_group_name = azurerm_resource_group.rg_vnet.name
  ttl                 = var.dns_default_ttl_sec
  records             = module.apim.private_ip_addresses
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "platform_vnetlink_vnet_prf" {
  count                 = var.env_short == "u" ? 1 : 0
  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.platform_private_dns_zone_prf[0].name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "platform_vnetlink_vnet_integration_prf" {
  count                 = var.env_short == "u" ? 1 : 0
  name                  = module.vnet_integration.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.platform_private_dns_zone_prf[0].name
  virtual_network_id    = module.vnet_integration.id
  registration_enabled  = false

  tags = var.tags
}


# Private DNS Zone for Postgres Databases

resource "azurerm_private_dns_zone" "postgres" {
  count = var.env_short != "d" ? 1 : 0

  name                = "private.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.rg_vnet.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgres_vnet" {
  count = var.env_short != "d" ? 1 : 0

  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.postgres[0].name
  virtual_network_id    = module.vnet.id
}

resource "azurerm_private_dns_zone" "privatelink_azurecr_pagopa" {
  name                = "privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

# Private DNS Zone for Cosmos Document DB
# https://docs.microsoft.com/it-it/azure/cosmos-db/how-to-configure-private-endpoints
resource "azurerm_private_dns_zone" "privatelink_documents_azure_com" {
  name                = "privatelink.documents.azure.com"
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_documents_azure_com_vnet" {
  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_documents_azure_com.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false

  tags = var.tags
}

# DNS private: internal.dev.platform.pagopa.it

resource "azurerm_private_dns_zone" "internal_platform_pagopa_it" {
  name                = "internal.${var.dns_zone_prefix}.${var.external_domain}"
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "internal_platform_pagopa_it_private_vnet" {
  name                  = module.vnet_integration.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.internal_platform_pagopa_it.name
  virtual_network_id    = module.vnet_integration.id
  registration_enabled  = false

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "internal_platform_vnetlink_vnet_core" {
  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.internal_platform_pagopa_it.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false

  tags = var.tags
}

# Cosmos MongoDB for ecommerce - private dns zone

resource "azurerm_private_dns_zone" "privatelink_mongo_cosmos_azure_com" {

  name                = "privatelink.mongo.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_privatelink_mongo_cosmos_azure_com" {

  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_mongo_cosmos_azure_com.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false

  tags = var.tags
}