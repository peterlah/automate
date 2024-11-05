###################
# Virtual Network #
###################
# create vnet resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

# create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_address]
}

