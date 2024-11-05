###########################
# Azure Kubernets Cluster #
###########################
# create aks cluster
resource "azurerm_kubernetes_cluster" "akscluster" {
  name                    = var.aks_cluster_name
  dns_prefix              = var.aks_cluster_dns_prefix
  location                = var.location
  resource_group_name     = var.rg_name
  kubernetes_version      = var.aks_version
  private_cluster_enabled = var.private_cluster_enabled
  private_dns_zone_id     = var.private_dns_zone_id
  azure_policy_enabled    = var.azure_policy_enabled

  /* ingress controller 연결 샘플 
  ingress_application_gateway {
    gateway_id = var.gateway_id
  }
  */

  oms_agent {
    log_analytics_workspace_id = var.log_ws_id
  }

  default_node_pool {
    name            = var.node_pool_name
    vm_size         = var.node_pool_sku
    os_disk_size_gb = var.vmss_os_disk_size
    type            = var.node_pool_type
    node_count      = var.node_count
    vnet_subnet_id  = var.subnet_id
    max_pods        = 100
  }

  network_profile {
    network_plugin     = var.network_plugin
    network_policy     = var.network_policy
    outbound_type      = var.outbound_type
    dns_service_ip     = var.dns_service_ip
    service_cidr       = var.service_cidr
    docker_bridge_cidr = var.docker_bridge_cidr
  }

  role_based_access_control_enabled = true

  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = [var.ad_group_id]
    azure_rbac_enabled     = true
  }

  identity {
    type         = var.identity_type
    identity_ids = [var.uami_id]
  }
}
