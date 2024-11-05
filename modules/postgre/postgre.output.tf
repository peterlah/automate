##############
# PostgreSQL #
##############
# output postgre id
output "postgre_id" {
  value = azurerm_postgresql_server.postgre.id
}