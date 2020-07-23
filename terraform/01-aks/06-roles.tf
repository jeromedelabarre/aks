resource "azurerm_role_assignment" "ra1" {
  scope                = data.azurerm_subnet.kubesubnet.id
  role_definition_name = "Network Contributor"
  principal_id         = var.aks_service_principal_object_id 

  depends_on = [azurerm_virtual_network.vnet_chrisley]
}

resource "azurerm_role_assignment" "ra2" {
  scope                = azurerm_user_assigned_identity.cleyIdentity.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = var.aks_service_principal_object_id
  depends_on           = [azurerm_user_assigned_identity.cleyIdentity]
}

resource "azurerm_role_assignment" "ra3" {
  scope                = azurerm_application_gateway.network.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.cleyIdentity.principal_id
  depends_on           = [azurerm_user_assigned_identity.cleyIdentity, azurerm_application_gateway.network]
}

resource "azurerm_role_assignment" "ra4" {
  scope                = azurerm_resource_group.rg-cley-aks.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.cleyIdentity.principal_id
  depends_on           = [azurerm_user_assigned_identity.cleyIdentity, azurerm_application_gateway.network]
}
