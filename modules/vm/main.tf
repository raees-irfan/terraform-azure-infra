resource "azurerm_linux_virtual_machine" "vm" {
    name = var.vm_name
    resource_group_name = var.resource_group_name
    location =var.location
    size = "Standard_B1s"
    admin_username = "azureuser"

    network_interface_ids = [
        var.nic_id
    ]
    secure_boot_enabled = true
    vtpm_enabled = true 
    #identity{
       # type = "SystemAssigned"
       # }

    os_disk  {
        caching = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }
    source_image_reference { 
        publisher = "canonical"
        offer = "ubuntu-24_04-lts"
        sku       = "server"
        version   = "latest"
    }
    boot_diagnostics {
  storage_account_uri = null
    }
    additional_capabilities {
  hibernation_enabled = false
  ultra_ssd_enabled   = false
    }

}