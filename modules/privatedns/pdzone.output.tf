####################
# Private DNS Zone #
####################
# output private dns zone id
output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.private_dns_zone.id
}