############################
# Azure Container Registry #
############################
# resource group name
variable "rg_name" {}

# location
variable "location" {}

# azure container registry name
variable "acr_name" {}

# azure container registry sku
variable "acr_sku" {
    default = "Premium"
}

# public access option
variable "public_access_allow" {
    default = "false"
}

# public access option
variable "identity_type" {
    default = "UserAssigned"
}

# uami id
variable "uami_id" {}

