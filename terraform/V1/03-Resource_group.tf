resource "azurerm_resource_group" "poc" {
  location = var.location
  name     = var.poc-name
  tags = {
    git_org = "jeromedelabarre"
  }
}
