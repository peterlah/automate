###############
# Redis Cache #
###############
#create redis cache 
resource "azurerm_redis_cache" "redis" {
  name                = var.redis_cache_name
  location            = var.location
  resource_group_name = var.rg_name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"

  redis_configuration {
    maxmemory_reserved = 1
    maxmemory_delta    = 1
  }
}