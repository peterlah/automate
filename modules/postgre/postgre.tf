##############
# PostgreSQL #
##############
#create postgresql
resource "azurerm_postgresql_server" "postgre" {
  name                = var.postgre_name
  location            = var.location
  resource_group_name = var.rg_name

  sku_name = "GP_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true


  administrator_login          = var.pg_admin
  administrator_login_password = var.pg_pass

  version = "11"
  ssl_enforcement_enabled      = true
}
#postgrel sku https://github.com/hashicorp/terraform-provider-azurerm/pull/5721/files 
