resource "azurerm_key_vault" "kv" {
  for_each            = var.key_vault_names
  name                = each.value
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  soft_delete_retention_days = 90
  purge_protection_enabled   = false
}