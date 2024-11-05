############
# Linux VM #
############
# output linux vm id
output "linux_vm_id" {
  value = azurerm_linux_virtual_machine.linux_vm.id
}
