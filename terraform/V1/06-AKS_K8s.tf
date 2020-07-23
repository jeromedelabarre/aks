resource "azurerm_kubernetes_cluster" "poc" {
  dns_prefix          = var.poc-name
  location            = var.location
  name                = var.poc-name
  resource_group_name = azurerm_resource_group.poc.name
  kubernetes_version  = var.kubernetes_version

  role_based_access_control {
    enabled = true
  }

  addon_profile {
    http_application_routing {
      enabled = true
    }
    kube_dashboard {
      enabled = true
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.poc.id
    }
  }

  default_node_pool {
    name            = "pocprofile"
    vm_size         = var.vm_size
    node_count      = var.vm_count
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = azuread_application.poc.application_id
    client_secret = azuread_application_password.poc.value
  }

  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = var.ssh_pub_key != "" ? var.ssh_pub_key : file("~/.ssh/id_rsa.pub")
    }
  }

  tags = {
    environment = "poc"
    maintainer  = var.author
  }
}
