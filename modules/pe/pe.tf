####################
# Private Endpoint #
####################
# create private endpoint
resource "azurerm_private_endpoint" "pe" {
  name                = var.pe_name
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_dns_zone_group {
    name                 = var.private_dns_zone_name
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  private_service_connection {
    name                           = var.pl_name
    is_manual_connection           = false
    private_connection_resource_id = var.id
    subresource_names              = [var.subresource_names]
  }
}