output "vm_id"{
    value = azurerm_linux_virtual_machine.vm.id
}

output "identity_principal_id" {
  value = try(azurerm_linux_virtual_machine.vm.identity[0].principal_id, null)
}