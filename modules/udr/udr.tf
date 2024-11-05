########################
# User Defined Routing #
########################
# create routing table
resource "azurerm_route_table" "route_table" {
  name                          = var.route_table_name
  resource_group_name           = var.rg_name
  location                      = var.location
  disable_bgp_route_propagation = false

  route {
    name                   = var.route_name
    address_prefix         = var.address_prefix
    next_hop_type          = var.next_hope_type
    next_hop_in_ip_address = var.next_hop_in_ip_address
  }
}

# associate route table to subnet
resource "azurerm_subnet_route_table_association" "rt_association" {

  depends_on = [
    azurerm_route_table.route_table
  ]

  subnet_id      = var.subnet_id
  route_table_id = azurerm_route_table.route_table.id
}