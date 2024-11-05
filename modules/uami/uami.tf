##################################
# User Assigned Managed Identity #
##################################
# create user assigned managed identity
resource "azurerm_user_assigned_identity" "uami" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = var.mi_name
}