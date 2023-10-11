resource "azurerm_resource_group" "data" {
  name     = format("%s-data-rg", local.project)
  location = var.location

  tags = var.tags
}


# Storage account to store backups: mainly api management
module "backupstorage" {
  count  = var.env_short == "p" ? 1 : 0
  source = "git::https://github.com/pagopa/azurerm.git//storage_account?ref=v2.1.26"

  name                     = replace(format("%s-backupstorage", local.project), "-", "")
  account_kind             = "BlobStorage"
  account_tier             = "Standard"
  account_replication_type = var.backup_storage_replication_type
  access_tier              = "Cool"
  enable_versioning        = true
  versioning_name          = "versioning"
  resource_group_name      = azurerm_resource_group.data.name
  location                 = var.location
  allow_blob_public_access = false

  tags = var.tags
}

resource "azurerm_storage_container" "apim_backup" {
  count                 = var.env_short == "p" ? 1 : 0
  name                  = "apim"
  storage_account_name  = module.backupstorage[0].name
  container_access_type = "private"
}

resource "azurerm_storage_management_policy" "backups" {
  count              = var.env_short == "p" ? 1 : 0
  storage_account_id = module.backupstorage[0].id

  rule {
    name    = "deleteafterdays"
    enabled = true
    filters {
      prefix_match = [azurerm_storage_container.apim_backup[0].name]
      blob_types   = ["blockBlob", "appendBlob"]
    }
    actions {
      version {
        delete_after_days_since_creation = 20
      }
    }
  }
}
