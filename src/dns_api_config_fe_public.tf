resource "azurerm_dns_zone" "api_config_fe_public" {
  count               = (var.dns_zone_api_config_fe == null || var.external_domain == null) ? 0 : 1
  name                = join(".", [var.dns_zone_api_config_fe, var.external_domain])
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

//Prod ONLY record to DEV public DNS delegation
resource "azurerm_dns_ns_record" "dev_api_config_fe" {
  count               = var.env_short == "p" ? 1 : 0
  name                = "dev"
  zone_name           = azurerm_dns_zone.api_config_fe_public[0].name
  resource_group_name = azurerm_resource_group.rg_vnet.name
  records = [
    "ns1-09.azure-dns.com.",
    "ns2-09.azure-dns.net.",
    "ns3-09.azure-dns.org.",
    "ns4-09.azure-dns.info."
  ]
  ttl  = var.dns_default_ttl_sec
  tags = var.tags
}

//Prod ONLY record to UAT public DNS delegation
//resource "azurerm_dns_ns_record" "uat_api_config_fe" {
//  count               = var.env_short == "p" ? 1 : 0
//  name                = "uat"
//  zone_name           = azurerm_dns_zone.api_config_fe_public[0].name
//  resource_group_name = azurerm_resource_group.rg_vnet.name
//  records = [
//    "ns1-07.azure-dns.com.",
//    "ns2-07.azure-dns.net.",
//    "ns3-07.azure-dns.org.",
//    "ns4-07.azure-dns.info."
//  ]
//  ttl  = var.dns_default_ttl_sec
//  tags = var.tags
//}
