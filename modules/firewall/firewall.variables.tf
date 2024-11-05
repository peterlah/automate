##################
# Azure Firewall #
##################
# firewall name
variable "firewall_name" {}

# resource group name
variable "rg_name" {}

# location name
variable "location" {}

# policy group name
variable "policy_group_name" {
    default = "default-policy-group"
}

# firewall public ip name
variable "firewall_pip_name" {}

# firewall name
variable "azure_firewall_name" {}

# firewall sku name
variable "firewall_sku_name" {}

# firewall sku tier
variable "firewall_sku_tier" {}

# firewall subnet id
variable "snet_id" {}