##############
# Windows VM #
##############
# create network interface card
resource "azurerm_network_interface" "win_vm_nic" {
  name                          = "${var.win_vm_name}-nic"
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

# create windows vm
resource "azurerm_windows_virtual_machine" "win_vm" {

  depends_on = [
    azurerm_network_interface.win_vm_nic
  ]

  name                            = var.win_vm_name
  location                        = var.location
  resource_group_name             = var.rg_name
  size                            = var.vm_sku
  admin_username                  = var.win_admin_username
  admin_password                  = var.win_admin_password
  
  network_interface_ids = [
    azurerm_network_interface.win_vm_nic.id
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

  boot_diagnostics {
    storage_account_uri = null
  }
}