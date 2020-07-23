resource "azurerm_virtual_network" "poc" {
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  name                = var.poc-name
  resource_group_name = azurerm_resource_group.poc.name

  subnet {
    address_prefix = "10.0.0.0/24"
    name           = var.poc-name
  }

  tags = {
    environment = "poc"
    maintainer  = var.author
  }
}

