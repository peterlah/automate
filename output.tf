output "vm_public_ip" {
  description = "The public IP address of the VM"
  value       = azurerm_public_ip.pip.ip_address
}

output "admin_username" {
  description = "The admin username for the VM"
  value       = var.admin_username
}

output "aks_credentials_command" {
  description = "The command to get AKS credentials"
  value       = "az aks get-credentials --resource-group ${azurerm_kubernetes_cluster.aks.resource_group_name} --name ${azurerm_kubernetes_cluster.aks.name} --overwrite-existing"
}
