resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg-cley-aks.location
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.kubernetes_version
  resource_group_name = azurerm_resource_group.rg-cley-aks.name

  linux_profile {
    admin_username = var.vm_user_name

    ssh_key {
      key_data = var.ssh_pub_key != "" ? var.ssh_pub_key : file("~/.ssh/id_rsa.pub")
    }

  }

  addon_profile {
    http_application_routing {
      enabled = false
    }
  }

  default_node_pool {
    name            = "agentpool"
    node_count      = var.aks_agent_count
    vm_size         = var.aks_agent_vm_size
    os_disk_size_gb = var.aks_agent_os_disk_size
    vnet_subnet_id  = data.azurerm_subnet.kubesubnet.id
  }

  service_principal {
    client_id     = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }

  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = var.aks_dns_service_ip
    docker_bridge_cidr = var.aks_docker_bridge_cidr
    service_cidr       = var.aks_service_cidr
  }

  depends_on = [azurerm_virtual_network.vnet_chrisley, azurerm_application_gateway.network]
  tags = merge(var.tags, {
    git_org = "jeromedelabarre"
  })
}
