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
  default     = "rg-cley-aks-SET_IN_GITLAB_CI"
}

variable "location" {
  description = "Location of the cluster."
  default     = "francecentral"  
}

variable "virtual_network_name" {
  description = "Virtual network name for SET_IN_GITLAB_CI"
  default     = "aksVirtualNetwork-SET_IN_GITLAB_CI"
}

variable "virtual_network_address_prefix" {
  description = "Containers DNS server IP address."
  default     = "FIRSTOCTET.0.0.0/8"
}

variable "aks_subnet_name" {
  description = "AKS Subnet Name for SET_IN_GITLAB_CI."
  default     = "kubesubnet-SET_IN_GITLAB_CI"
}

variable "app_gateway_subnet_name" {
  description = "Application GW Subnet Name for SET_IN_GITLAB_CI."
  default     = "appgwkubesubnet-SET_IN_GITLAB_CI"
}

variable "aks_subnet_address_prefix" {
  description = "Containers DNS server IP address."
  default     = "FIRSTOCTET.0.0.0/16"
}

variable "app_gateway_subnet_address_prefix" {
  description = "Containers DNS server IP address."
  default     = "FIRSTOCTET.1.0.0/16"
}

variable "app_gateway_name" {
  description = "Name of the Application Gateway for SET_IN_GITLAB_CI."
  default = "ApplicationGateway1-SET_IN_GITLAB_CI"
}

variable "app_gateway_sku" {
  description = "Name of the Application Gateway SKU."
  default = "Standard_v2"
}

variable "app_gateway_tier" {
  description = "Tier of the Application Gateway SKU."
  default = "Standard_v2"
}

variable "aks_name" {
  description = "Name of the AKS cluster for SET_IN_GITLAB_CI."
  default     = "aks-chrisley-cluster1-SET_IN_GITLAB_CI"
}
variable "aks_dns_prefix" {
  description = "Optional DNS prefix to use with hosted Kubernetes API server FQDN for SET_IN_GITLAB_CI."
  default     = "aks-SET_IN_GITLAB_CI"
}

variable "aks_agent_os_disk_size" {
  description = "Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 0 to 1023. Specifying 0 applies the default disk size for that agentVMSize."
  default     = 40
}

variable "aks_agent_count" {
  description = "The number of agent nodes for the cluster."
  default     = 3
}

variable "aks_agent_vm_size" {
  description = "The size of the Virtual Machine."
  default     = "Standard_D3_v2"
}

variable "kubernetes_version" {
  description = "The version of Kubernetes."
  default     = "1.18.4"
}

variable "aks_service_cidr" {
  description = "A CIDR notation IP range from which to assign service cluster IPs."
  default     = "10.0.0.0/16"
}

variable "aks_dns_service_ip" {
  description = "Containers DNS server IP address."
  default     = "10.0.0.10"
}

variable "aks_docker_bridge_cidr" {
  description = "A CIDR notation IP for Docker bridge."
  default     = "172.17.0.1/16"
}

variable "aks_enable_rbac" {
  description = "Enable RBAC on the AKS cluster. Defaults to false."
  default     = "false"
}

variable "vm_user_name" {
  description = "User name for the VM"
  default     = "chrisley"
}

variable "ssh_pub_key" {
  description = "Public SSH Key" 
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDvKS/5y2MKKWzcDnpcGQL2SMe7D2N/+zBU8vIRVYV46jocU2MLLqQgNZGat+uASUC+HUPLyopgCdBCkXErLpF7Bk6RJPjFhLPxuc0+LKGQAd3d5FpCivlNEwJkExpw555xM/wvKRq/rNUT+RYXg8xDDnzhjzWUhUIPX5lD00pqHsDfOg2+i8UuCN2xW81b7LfTdtL/kc6J2iv5sxEijbdnUVsWHO6/jogv0w12bAB5GgHNdBFMlkoBkBvbirWfcVElG+oFr/ObnddhRvNTgD0ozAeQkU6g05BjQzgrBUpwb4jy5ar8eku17oZZFvq41693KRQEl7vakEJal4TokEyev62yCLfT4OuhOMp4axzv15DplnHOjGJlGvDeM5cOTz3gQgis8OJqCklCN6es1u/e7Oxd2NoqEic9HxUhn+NdvOz1iSqovDvZxyBdSKFthLa8TwMn0fDbVTkmtTqCPilt1msfx7RneChNAi85s60Dfy0W3wTIwnUQ181CUGBPLJC0gbp6rQKaknhEEEVoIsRWCztwFhD+rLOQAqU4wDmufA5MMEbj5qs04Ij2/pi8kVRjz9sAAlJWtYk9MApbFc4vuJn4AuNkjdomKHuXA0p8xkRGwc7S7MCtjl/EDYEiHmimPb8EWuv6Yve4yRp5MlAbnLf9czuEVQUsvtwMtjxkIw== ley@MacBook-Pro-de-LEY.home"
}


#####################	
### Creation des tags
#####################

variable "tags" {
  type = map(string)

  default = {
    source  = "terraform"
    author  = "Christopher LEY"
    project = "aks"
    product = "kubernetes 1.18.4"
    env     = "SET_IN_GITLAB_CI"
  }
}
