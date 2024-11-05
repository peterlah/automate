###########################
# Log Analytics Workspace #
###########################
# create log analytics workspace
resource "azurerm_log_analytics_workspace" "log_ws" {
  name                = var.log_ws_name
  location            = var.location
  resource_group_name = var.rg_name
  retention_in_days   = var.retention_in_days
}
# The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730.