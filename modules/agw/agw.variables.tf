#######################
# Application Gateway #
#######################
# agw name
variable "agw_name" {}

# location
variable "location" {}

# rg name
variable "rg_name" {}

# sku name
variable "sku_name" {
    default = "Standard_v2"
}

# sku tier
variable "sku_tier" {
    default = "Standard_v2"
}

# private ip name
variable "private_ip_name" {}

# subnet id
variable "subnet_id" {}

# frontend port
variable "frontend_port_name" {
    default = "http"
}

# public ip address name
variable "public_ip_address_name" {}

# public ip id
variable "public_ip_id" {}

# backendpool name
variable "backendpool_name" {
    default = "backendpool"
}

# http setting name
variable "backend_http_settings_name" {
    default = "backend-http-setting"    
}

# http setting affinity
variable "backend_http_settings_affinity" {
    default = "Disabled"
}

# http setting port
variable "backend_http_settings_port" {
    default = 80  
}

# http setting protocol
variable "backend_http_settings_protocol" {
    default = "Http"
}

# http listener name
variable "http_listener_name" {
    default = "listner"
}

# http listener protocol
variable "http_listener_protocol" {
    default = "Http"  
}