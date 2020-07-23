###################	
## Creation du vNET
###################

resource "azurerm_virtual_network" "vnet_chrisley" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.rg-cley-aks.location
  resource_group_name = azurerm_resource_group.rg-cley-aks.name
  address_space       = [var.virtual_network_address_prefix]

  subnet {
    name           = var.aks_subnet_name
    address_prefix = var.aks_subnet_address_prefix
  }

  subnet {
    name           = var.app_gateway_subnet_name
    address_prefix = var.app_gateway_subnet_address_prefix
  }

  tags = var.tags
}

#######################
## Creation des Subnets
#######################

data "azurerm_subnet" "kubesubnet" {
  name                 = var.aks_subnet_name
  virtual_network_name = azurerm_virtual_network.vnet_chrisley.name
  resource_group_name  = azurerm_resource_group.rg-cley-aks.name
}

data "azurerm_subnet" "appgwsubnet" {
  name                 = var.app_gateway_subnet_name
  virtual_network_name = azurerm_virtual_network.vnet_chrisley.name
  resource_group_name  = azurerm_resource_group.rg-cley-aks.name
}

#######################
## Creation IP Publique
#######################

# Public Ip 
resource "azurerm_public_ip" "publicIP_aks_chrisley" {
  name                         = "publicIpAKS-SET_IN_GITLAB_CI"
  location                     = azurerm_resource_group.rg-cley-aks.location
  resource_group_name          = azurerm_resource_group.rg-cley-aks.name
  allocation_method            = "Static"
  sku                          = "Standard"

  tags = var.tags
}
