###################
# Virtual Network #
###################
# define default location of region
variable "location" {
  default = "koreacentral"
}

# vnet resource group name
variable "rg_name" {}

# vnet name
variable "vnet_name" {}

# vnet address
variable "vnet_address" {}
