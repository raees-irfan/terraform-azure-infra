data "azurerm_client_config" "current" {}

module "rg" {
  source   = "../modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "../modules/network"
  resource_group_name = module.rg.name
  location            = module.rg.location
  nsg_name            = var.nsg_name
}

module "keyvault" {
  source              = "../modules/keyvault"
  resource_group_name = module.rg.name
  location            = module.rg.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  key_vault_names     = var.key_vault_names
}

module "storage" {
  source = "../modules/storage"
  storage_account_name = var.storage_account_name
  resource_group_name = module.rg.name
  location = module.rg.location
}

module "appinsights" {
  source              = "../modules/appinsights"
  resource_group_name = module.rg.name
  location            = module.rg.location

 # log_analytics_name  = "law-terraform"
  app_insights_name   = "terraform_appinsights"
  workspace_id = "/subscriptions/4475ed01-f930-4b0c-bcc6-0b4e85b22d7a/resourceGroups/DefaultResourceGroup-southindia/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-4475ed01-f930-4b0c-bcc6-0b4e85b22d7a-southind"
}

module "vm" {
  source = "../modules/vm"
  vm_name = var.vm_name
  resource_group_name = module.rg.name
  location = module.rg.location
  nic_id = var.nic_id
}