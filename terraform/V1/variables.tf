## AZURE
variable "ARM_ACCESS_KEY" {}
variable "ARM_SUBSCRIPTION_ID" {}
variable "ARM_CLIENT_ID" {}
variable "ARM_CLIENT_SECRET" {}
variable "ARM_TENANT_ID" {}

### K8s aks spec
variable "location" {
  type    = string
  default = "francecentral"
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "vm_count" {
  type    = number
  default = 3
}
variable "admin_username" {
  type    = string
  default = "chrisley"
}
variable "ssh_pub_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDvKS/5y2MKKWzcDnpcGQL2SMe7D2N/+zBU8vIRVYV46jocU2MLLqQgNZGat+uASUC+HUPLyopgCdBCkXErLpF7Bk6RJPjFhLPxuc0+LKGQAd3d5FpCivlNEwJkExpw555xM/wvKRq/rNUT+RYXg8xDDnzhjzWUhUIPX5lD00pqHsDfOg2+i8UuCN2xW81b7LfTdtL/kc6J2iv5sxEijbdnUVsWHO6/jogv0w12bAB5GgHNdBFMlkoBkBvbirWfcVElG+oFr/ObnddhRvNTgD0ozAeQkU6g05BjQzgrBUpwb4jy5ar8eku17oZZFvq41693KRQEl7vakEJal4TokEyev62yCLfT4OuhOMp4axzv15DplnHOjGJlGvDeM5cOTz3gQgis8OJqCklCN6es1u/e7Oxd2NoqEic9HxUhn+NdvOz1iSqovDvZxyBdSKFthLa8TwMn0fDbVTkmtTqCPilt1msfx7RneChNAi85s60Dfy0W3wTIwnUQ181CUGBPLJC0gbp6rQKaknhEEEVoIsRWCztwFhD+rLOQAqU4wDmufA5MMEbj5qs04Ij2/pi8kVRjz9sAAlJWtYk9MApbFc4vuJn4AuNkjdomKHuXA0p8xkRGwc7S7MCtjl/EDYEiHmimPb8EWuv6Yve4yRp5MlAbnLf9czuEVQUsvtwMtjxkIw== ley@MacBook-Pro-de-LEY.home"
}

variable "poc-name" {
  type    = string
  default = "poc-kubernetes"
}

variable "author" {
  type    = string
  default = "chrisley"
}
variable "client_secret" {
  type    = string
  default = "69b92da7-27eb-4dcf-a0b9-879d83e5faec"
}

variable "kubernetes_version" {
  type    = string
  default = "1.18.4"
}
