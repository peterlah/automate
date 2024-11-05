##############
# Windows VM #
##############
# output windows vm id
output "windows_vm_id" {
  value = azurerm_windows_virtual_machine.win_vm.id
}
