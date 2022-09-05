module "notifications_service_storage" {
  source = "git::https://github.com/pagopa/azurerm.git//storage_account?ref=v2.18.10"

  name                       = replace("${var.prefix}-${var.env_short}-notifications-sa", "-", "")
  account_kind               = var.notifications_service_queue_params.kind
  account_tier               = var.notifications_service_queue_params.tier
  account_replication_type   = var.notifications_service_queue_params.account_replication_type
  access_tier                = "Hot"
  versioning_name            = "versioning"
  enable_versioning          = true
  resource_group_name        = azurerm_resource_group.shared_rg.name
  location                   = var.location
  advanced_threat_protection = var.notifications_service_queue_params.advanced_threat_protection
  allow_blob_public_access   = false

  blob_properties_delete_retention_policy_days = var.notifications_service_queue_params.retention_days

  network_rules = var.storage_private_endpoint_enabled ? {
    default_action             = "Deny"
    ip_rules                   = []
    virtual_network_subnet_ids = [module.notifications_service_storage_snet.id]
    bypass                     = ["AzureServices"]
  } : null

  tags = var.tags
}

resource "azurerm_storage_queue" "notifications_service_retry_queue" {
  name                 = "${local.project}-notifications-service-retry-queue"
  storage_account_name = module.notifications_service_storage.name
}

resource "azurerm_storage_queue" "notifications_service_errors_queue" {
  name                 = "${local.project}-notifications-service-errors-queue"
  storage_account_name = module.notifications_service_storage.name
}

module "notifications_service_storage_snet" {
  source               = "git::https://github.com/pagopa/azurerm.git//subnet?ref=v2.18.10"
  name                 = "${local.project}-storage-snet"
  address_prefixes     = var.cidr_subnet_notifications_service_storage
  resource_group_name  = local.vnet_resource_group_name
  virtual_network_name = local.vnet_name

  enforce_private_link_endpoint_network_policies = true

  service_endpoints = [
    "Microsoft.Storage",
  ]
}

resource "azurerm_private_endpoint" "storage_private_endpoint" {
  count = var.storage_private_endpoint_enabled ? 1 : 0

  name                = "${local.project}-notifications-service-queues-private-endpoint"
  location            = var.location
  resource_group_name = azurerm_resource_group.shared_rg.name
  subnet_id           = module.notifications_service_storage_snet.id

  private_dns_zone_group {
    name                 = "${local.project}-notifications-service-queues-private-dns-zone-group"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.storage.id]
  }

  private_service_connection {
    name                           = "${local.project}-notifications-service-queues-private-service-connection"
    private_connection_resource_id = module.notifications_service_storage.id
    is_manual_connection           = false
    subresource_names              = ["queue"]
  }

  tags = var.tags
}