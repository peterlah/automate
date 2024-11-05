############
# Linux VM #
############
# resource group name
variable "rg_name" {}

# location
variable "location" {}

# linux vm name
variable "linux_vm_name" {}

# enable accelerated networking
variable "enable_accelerated_networking" {
    default = "true"
}

# ip configuration name
variable "ip_configuration_name" {
    default = "internal"
}

# subnet id
variable "subnet_id" {}

# private ip address allocation
variable "private_ip_address_allocation" {
    default = "Dynamic"
}

# subnet id
variable "public_ip_id" {}

# vm sku
variable "vm_size" {}

# linux admin username
variable "linux_admin_username" {}

# linux admin password
variable "linux_admin_password" {}

# disable password authentication
variable "disable_password_authentication" {
    default = "false"
}

# os disk caching
variable "caching" {
    default = "ReadWrite"
}

# disk type
variable "storage_account_type" {
  default = "StandardSSD_LRS"
}

# vm sku
variable "vm_sku" {
  default = "Standard_D2s_v3"
}

# os disk size
variable "disk_size_gb" {
  default = "32"
}

# os publisher
variable "os_publisher" {
  default = "Canonical"
}

# os offer
variable "os_offer" {
  default = "UbuntuServer"
}

# os sku
variable "os_sku" {
  default = "18.04-LTS"
}

# os version
variable "os_version" {
  default = "latest"
}

# identity type
variable "identity_type" {
  default = "UserAssigned"
}

# uami id
variable "uami_id" {}