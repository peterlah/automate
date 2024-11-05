###########################
# Azure Kubernets Cluster #
###########################
# output cluster id
output "aks_id" {
  value = azurerm_kubernetes_cluster.akscluster.id
}

# output kublet id
output "kubelet_id" {
  value = azurerm_kubernetes_cluster.akscluster.kubelet_identity[0].object_id
}