#####################
# Azure NAT Gateway #
#####################
# resource group name
variable "rg_name" {}

# location
variable "location" {}

# nat gateway public ip name
variable "nat_pip_name" {
    default = "nat-gateway-pip"
}

# nat gateway name
variable "natgw_name" {}

# subnet id
variable "subnet_id" {}


