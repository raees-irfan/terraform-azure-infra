resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type  = "Linux"
  sku_name = var.sku_name  
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {}

  identity {
    type = "SystemAssigned"
  }

  https_only = true
}

# 🔹 Staging slot
resource "azurerm_linux_web_app_slot" "staging" {
  name           = "staging"
  app_service_id = azurerm_linux_web_app.app.id

  site_config {}

  https_only = true
}

# 🔹 Dev slot
resource "azurerm_linux_web_app_slot" "dev" {
  name           = "dev"
  app_service_id = azurerm_linux_web_app.app.id

  site_config {}

  https_only = true
}