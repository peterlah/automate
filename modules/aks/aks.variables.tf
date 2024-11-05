###########################
# Azure Kubernets Cluster #
###########################
# resource group name
variable "rg_name" {}

# location
variable "location" {}

# aks cluster name
variable "aks_cluster_name" {}

# aks cluster dns prefix
variable "aks_cluster_dns_prefix" {}

# kubernets version
variable "aks_version" {}

# private cluster enabled
variable "private_cluster_enabled" {
    default = "true"
}

# private dns zone id
variable "private_dns_zone_id" {}

# azure policy enabled
variable "azure_policy_enabled" {
    default = "true"
}

# loganalytics workspace id
variable "log_ws_id" {}

# node pool name
variable "node_pool_name" {
    default = "default"
}

# node pool sku
variable "node_pool_sku" {
    default = "Standard_E2s_v5"
}

# vmss os disk size
variable "vmss_os_disk_size" {
    default = 64
}

# node pool type
variable "node_pool_type" {
    default = "VirtualMachineScaleSets"
}

# node count
variable "node_count" {
    default = 2
}

# aks vmss subnet id
variable "subnet_id" {}

# network plugin
variable "network_plugin" {
    default = "azure"
}

# network policy
variable "network_policy" {
    default = "azure"
}

# outbound type
variable "outbound_type" {
    default = "userAssignedNATGateway"
}

# dns service ip
variable "dns_service_ip" {
    default = "192.168.100.10"
}

# cluster service cidr
variable "service_cidr" {
    default = "192.168.100.0/24"
}

# cluster docker bridge cidr
variable "docker_bridge_cidr" {
    default = "172.17.0.1/16"
}

# azure ad group id
variable "ad_group_id" {}

# identity type
variable "identity_type" {
    default = "UserAssigned"
}

# aks uami id
variable "uami_id" {}