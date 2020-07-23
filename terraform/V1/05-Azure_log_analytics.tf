resource "azurerm_log_analytics_workspace" "poc" {
  location            = var.location
  name                = var.poc-name
  resource_group_name = azurerm_resource_group.poc.name
  sku                 = "PerGB2018"
  retention_in_days   = "30"
}

