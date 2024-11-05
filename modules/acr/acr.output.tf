############################
# Azure Container Registry #
############################
# output azure container registry id
output "acr_id" {
  value = azurerm_container_registry.acr.id
}