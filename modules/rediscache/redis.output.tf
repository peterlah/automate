###############
# Redis Cache #
###############
# output redis id
output "redis_id" {
  value = azurerm_redis_cache.redis.id
}