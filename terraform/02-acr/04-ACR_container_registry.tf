resource "azurerm_container_registry" "acr_chrisley" {
  location            = azurerm_resource_group.rg-cley-acr.location
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg-cley-acr.name
  sku                 = "basic"

  tags = merge(var.tags, {
    git_org = "jeromedelabarre"
  })
}
