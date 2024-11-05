####################
# Private DNS Zone #
####################
# create dns zone
resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.rg_name
}
 
# create dns zone virtual network link
resource "azurerm_private_dns_zone_virtual_network_link" "link_to_hub" {

  depends_on = [
    azurerm_private_dns_zone.private_dns_zone
  ]

  name                  = var.link_to_hub_name
  resource_group_name   = var.rg_name
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = var.hub_vnet_id
}

resource "azurerm_private_dns_zone_virtual_network_link" "link_to_spoke" {

  depends_on = [
    azurerm_private_dns_zone.private_dns_zone
  ]

  name                  = var.link_to_spoke_name
  resource_group_name   = var.rg_name
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = var.spoke_vnet_id
}

