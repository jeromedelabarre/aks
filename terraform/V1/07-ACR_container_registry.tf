resource "azurerm_container_registry" "poc" {
  location            = var.location
  name                = "PoCRegistry${random_pet.random_name.id}"
  resource_group_name = azurerm_resource_group.poc.name
  sku                 = "basic"

  tags = {
    environment = "poc"
    maintainer  = var.author
  }
}
