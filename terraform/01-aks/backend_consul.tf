terraform {
  backend "consul" {
    address = "consul.chrisley.fr:8500"
    path    = "tf/SET_IN_GITLAB_CI/azure_aks_state"
  }
}

