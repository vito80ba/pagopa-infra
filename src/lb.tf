module "lb_snet" {
  source               = "git::https://github.com/pagopa/azurerm.git//subnet?ref=v1.0.51"
  name                 = format("%s-lb-snet", local.project)
  resource_group_name  = azurerm_resource_group.rg_vnet.name
  virtual_network_name = module.vnet_integration.name
  address_prefixes     = var.cidr_subnet_lb

  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Web"]
}


module "integration_lb" {
  count  = var.lb_enabled && var.cidr_subnet_lb != null ? 1 : 0
  source = "git::https://github.com/pagopa/azurerm.git//load_balancer?ref=fix-lb-module"
  # source                                 = "git::https://github.com/pagopa/azurerm.git//load_balancer?ref=v1.0.81"
  name                                   = format("%s-lb-integration", local.project)
  resource_group_name                    = azurerm_resource_group.rg_vnet.name
  location                               = var.location
  type                                   = "private"
  frontend_subnet_id                     = module.lb_snet.id
  frontend_private_ip_address_allocation = "Static"
  frontend_private_ip_address            = var.lb_integration_frontend_ip
  lb_sku                                 = "Standard"
  pip_sku                                = "Standard" #`pip_sku` must match `lb_sku`

  lb_backend_pools = [
    {
      name = "db-nodo-sia"
      ips = [
        {
          ip      = "10.101.35.39"
          vnet_id = module.vnet_integration.id
        },
        {
          ip      = "10.101.35.40"
          vnet_id = module.vnet_integration.id
        },
        {
          ip      = "10.101.35.41"
          vnet_id = module.vnet_integration.id
        }
      ]
    }
  ]

  lb_port = {
    sftp-sia = {
      frontend_port     = "8022"
      protocol          = "Tcp"
      backend_port      = "8022",
      backend_pool_name = "db-nodo-sia"
      probe_name        = "tcp-8022"
    }
  }

  lb_probe = {
    tcp-8022 = {
      protocol     = "Tcp"
      port         = "8022"
      request_path = ""
    }
  }

  tags = var.tags
}
