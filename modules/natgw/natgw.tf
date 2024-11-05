#####################
# Azure NAT Gateway #
#####################
# create public ip
resource "azurerm_public_ip" "pip" {
  name                = var.nat_pip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# create nat gateway
resource "azurerm_nat_gateway" "natgw" {

  depends_on = [
    azurerm_public_ip.pip
  ]

  name                    = var.natgw_name
  location                = var.location
  resource_group_name     = var.rg_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 4
}

# public ip association
resource "azurerm_nat_gateway_public_ip_association" "pip_to_nat" {
  
  depends_on = [
    azurerm_public_ip.pip,
    azurerm_nat_gateway.natgw
  ]  

  nat_gateway_id       = azurerm_nat_gateway.natgw.id
  public_ip_address_id = azurerm_public_ip.pip.id
}

# subnet association
resource "azurerm_subnet_nat_gateway_association" "subnet_to_nat" {
  
  depends_on = [
    azurerm_public_ip.pip,
    azurerm_nat_gateway.natgw,
    azurerm_nat_gateway_public_ip_association.pip_to_nat
  ]    

  subnet_id      = var.subnet_id
  nat_gateway_id = azurerm_nat_gateway.natgw.id
}


# prefix 사용 샘플
/*
resource "azurerm_public_ip_prefix" "example" {
  name                = "nat-gateway-publicIPPrefix"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  prefix_length       = 30
  zones               = ["1"]
}
*/
# 최대 16개의 공인아이피 할당 가능