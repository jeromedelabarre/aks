#######################################################################
### Identification pour deploiement via SP (Service principal chrisley)
#######################################################################
## AZURE
variable "ARM_ACCESS_KEY" {}
variable "ARM_SUBSCRIPTION_ID" {}
variable "ARM_CLIENT_ID" {}
variable "ARM_CLIENT_SECRET" {}
variable "ARM_TENANT_ID" {}

variable "aks_service_principal_app_id" {
  description = "Application ID/Client ID  of the service principal. Used by AKS to manage AKS related resources on Azure like vms, subnets."
}

variable "aks_service_principal_client_secret" {
  description = "Secret of the service principal. Used by AKS to manage Azure."
}

variable "aks_service_principal_object_id" {
  description = "Object ID of the service principal."
}

#############################
### Definition des parametres
#############################

variable "resource_group_name" {
  description = "Name of the resource group for SET_IN_GITLAB_CI"
  default     = "rg-cley-acr-SET_IN_GITLAB_CI"
}

variable "location" {
  description = "Location of the cluster."
  default     = "francecentral"  
}

variable "acr_name" {
  description = "Name of the ACR Container Image Registry."
  default     = "acr01chrisleySET_IN_GITLAB_CI"
}

#####################	
### Creation des tags
#####################

variable "tags" {
  type = map(string)

  default = {
    source  = "terraform"
    author  = "Christopher LEY"
    project = "acr"
    product = "Container Image registry"
    env     = "SET_IN_GITLAB_CI"
  }
}
