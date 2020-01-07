# Creates public key for linux ssh worker nodes
resource "tls_private_key" "key" {
  algorithm   = "RSA"
  ecdsa_curve = "P224"
  rsa_bits    = "2048"
}


#Create the resource groups to host the blueprint

module "resource_group" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"

  prefix          = var.prefix
  resource_groups = var.resource_groups_shared_services
  tags            = local.tags
}


module "azurerm_kubernetes_cluster" {
    
    source = ""
    #source  = "aztfmod/caf-kubernetes-cluster/azurerm"
    #version = "0.1.0"
  
      dns_prefix          = "aks-${var.app_name}-${var.env}-${local.random}"
      resource_group_name = var.resource_group_name
      location            = var.location
      node_resource_group = var.aks_node_rg
      admin_username = var.linux_admin_username
}