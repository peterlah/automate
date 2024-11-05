###################
# Virtual Network #
###################
# output vnet id
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}