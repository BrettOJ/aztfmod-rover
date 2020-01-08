#Create the resource groups to host the blueprint
module "resource_group_hub" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
  prefix          = var.prefix
  resource_groups = var.resource_groups_hub
  tags            = local.tags
}

#Specify the subscription logging repositories 
module "application_gateway" {
  source  = "aztfmod/caf-activity-logs/azurerm"
  version = "0.1.1"

  prefix              = var.prefix
  resource_group_name = module.resource_group_hub.names["HUB-CORE-SEC"]
  location            = var.location
  tags                = local.tags
  logs_rentention     = var.azure_activity_logs_retention
}




