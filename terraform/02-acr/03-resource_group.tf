## Creation du group de resource
resource "azurerm_resource_group" "rg-cley-acr" {
  location = var.location
  name     = var.resource_group_name
}
