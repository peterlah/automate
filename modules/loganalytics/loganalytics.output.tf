###########################
# Log Analytics Workspace #
###########################
# output log analytics workspace id
output "workspace_id" {
  value = azurerm_log_analytics_workspace.log_ws.id
}
