## Locals block for hardcoded names. 
locals {
    backend_address_pool_name      = "${azurerm_virtual_network.vnet_chrisley.name}-beap"
    frontend_port_name             = "${azurerm_virtual_network.vnet_chrisley.name}-feport"
    frontend_ip_configuration_name = "${azurerm_virtual_network.vnet_chrisley.name}-feip"
    http_setting_name              = "${azurerm_virtual_network.vnet_chrisley.name}-be-htst"
    listener_name                  = "${azurerm_virtual_network.vnet_chrisley.name}-httplstn"
    request_routing_rule_name      = "${azurerm_virtual_network.vnet_chrisley.name}-rqrt"
    app_gateway_subnet_name        = var.app_gateway_subnet_name
}

## Generation d'un nom aléatoire pour le cluster
resource "random_pet" "random_name" {
  keepers   = {
    name = var.aks_name
  }
  separator = ""
}

