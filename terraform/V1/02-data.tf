## Utilisation de la souscription primaire
data "azurerm_subscription" "primary" {}

## Generation d'un nom aléatoire pour le cluster
resource "random_pet" "random_name" {
  keepers   = {
    poc_name = var.poc-name
  }
  separator = ""
}

## Creation d'un application azuread
resource "azuread_application" "poc" {
  name = var.poc-name
}

## definition du password pour l'application azuread
resource "azuread_application_password" "poc" {
  value                 = var.client_secret
  end_date              = "2099-01-01T00:00:00Z"
  application_object_id = azuread_application.poc.id
}

## Creation du service principal
resource "azuread_service_principal" "poc" {
  application_id = azuread_application.poc.application_id
}

## Assignation du role contributor pour le SP precedement cree
resource "azurerm_role_assignment" "poc" {
  principal_id         = azuread_service_principal.poc.object_id
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
}

## Assignation du role AcrPull pour le SP precedement cree
resource "azurerm_role_assignment" "acr" {
  principal_id         = azuread_service_principal.poc.object_id
  scope                = azurerm_container_registry.poc.id
  role_definition_name = "AcrPull"
}

