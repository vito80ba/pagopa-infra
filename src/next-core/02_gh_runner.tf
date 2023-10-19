
module "runner" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//container_app_job_gh_runner?ref=v7.14.0"

  location  = var.location
  prefix    = var.prefix
  env_short = var.env_short


  # set reference to the secret which holds the GitHub PAT with access to your repos
  key_vault = {
    resource_group_name = data.azurerm_key_vault.kv.resource_group_name
    name                = data.azurerm_key_vault.kv.name
    secret_name         = var.gh_pat_kv_secret_name
  }

  # creates a subnet in the specified existing vnet. Use a /23 CIDR block
  network = {
    vnet_resource_group_name      = data.azurerm_virtual_network.vnet_core.resource_group_name
    vnet_name         = data.azurerm_virtual_network.vnet_core.name
    subnet_cidr_block = var.gh_runner_subnet_cidr
  }

  # set reference to the log analytics workspace you want to use for logging
  environment = {
    customerId = data.azurerm_log_analytics_workspace.log_analytics.workspace_id
    sharedKey    = data.azurerm_log_analytics_workspace.log_analytics.primary_shared_key
  }

  # set app properties - especially the list of repos to support
  app = {
    repos      = var.gh_pat_repos
    repo_owner = "pagopa"
  }

  tags = var.tags
}
