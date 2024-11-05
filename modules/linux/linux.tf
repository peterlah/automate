############
# Linux VM #
############
# create network interface card
resource "azurerm_network_interface" "linux_vm_nic" {
  name                          = "${var.linux_vm_name}-nic"
  location                      = var.location
  resource_group_name           = var.rg_name
  enable_accelerated_networking = var.enable_accelerated_networking

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_id
  }
}

# create linux vm
resource "azurerm_linux_virtual_machine" "linux_vm" {

  depends_on = [
    azurerm_network_interface.linux_vm_nic
  ]

  name                            = var.linux_vm_name
  location                        = var.location
  resource_group_name             = var.rg_name
  size                            = var.vm_sku
  admin_username                  = var.linux_admin_username
  admin_password                  = var.linux_admin_password
  disable_password_authentication = var.disable_password_authentication //Set to true if using SSH key

  network_interface_ids = [
    azurerm_network_interface.linux_vm_nic.id
  ]

  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
    disk_size_gb         = var.disk_size_gb
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.uami_id]
  }

  boot_diagnostics {
    storage_account_uri = null
  }
}

/* SSH 키를 통한 VM 인증 샘플
# Create (and display) an SSH key
resource "tls_private_key" "linux_vm_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# create linux vm using SSH key
resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                            = var.linux_server_name
  location                        = var.location
  resource_group_name             = var.hub_rg_name
  size                            = var.vm_size
  disable_password_authentication = var.disable_password_authentication //Set to true if using SSH key

  admin_ssh_key {
    username   = "azureadmin"
    public_key = tls_private_key.linux_vm_ssh.public_key_openssh
  }

  network_interface_ids = [
    azurerm_network_interface.linux_vm_nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
    disk_size_gb = var.disk_size_gb
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }

  boot_diagnostics {
    storage_account_uri = null
  }
}

# output에 아래 내용 추가
output "tls_private_key" {
  value     = tls_private_key.linux_vm_ssh.private_key_pem
  sensitive = true
}

# 아래 명령으로 rsa 키확인
terraform output -raw tls_private_key > id_rsa
*/
