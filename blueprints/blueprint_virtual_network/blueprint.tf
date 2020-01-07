#Create the resource groups to host the blueprint

module "resource_group" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"

  prefix          = var.prefix
  resource_groups = var.resource_groups_shared_services
  tags            = local.tags
}

locals {
  HUB-CORE-NET = lookup(module.resource_group.names, "HUB-CORE-NET", null)
}


module "networking_vnet" {
  source  = "aztfmod/caf-virtual-network/azurerm"
 version = "0.2.0"

  virtual_network_rg                = local.HUB-CORE-NET
  prefix                            = var.prefix
  location                          = var.location
  networking_object                 = var.main_vnet
  tags                              = local.tags
  diagnostics_map                   = var.diagnostics_map
  log_analytics_workspace           = var.log_analytics_workspace
}


