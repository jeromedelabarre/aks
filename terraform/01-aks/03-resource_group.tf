## Creation du group de resource
resource "azurerm_resource_group" "rg-cley-aks" {
  location = var.location
  name     = var.resource_group_name
}

# User Assigned Identities 
resource "azurerm_user_assigned_identity" "cleyIdentity" {
  resource_group_name = azurerm_resource_group.rg-cley-aks.name
  location            = azurerm_resource_group.rg-cley-aks.location

  name = "cleyidentity1-SET_IN_GITLAB_CI"

  tags = var.tags
}
