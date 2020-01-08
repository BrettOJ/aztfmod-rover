#Create the resource groups to host the blueprint
module "resource_group_hub" {
  source  = "../modules/terraform-azurerm-caf-resource-group"
  version = "0.1.1"
  
  prefix          = var.prefix
  resource_groups = var.resource_groups_hub
  tags            = local.tags
}

