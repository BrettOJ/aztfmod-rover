provider "azurerm" {
  version = "<=1.35"
}


terraform {
    backend "azurerm" {
    }
}

data "terraform_remote_state" "landingzone_caf_level1" {
  backend = "azurerm"
  config = {
    storage_account_name  = var.lowerlevel_storage_account_name
    container_name        = var.lowerlevel_container_name 
    key                   = var.lowerlevel_key
    resource_group_name   = var.lowerlevel_resource_group_name
  }
}

locals {
    prefix                        = data.terraform_remote_state.landingzone_caf_level1.outputs.prefix
    log_analytics_workspace_id    = data.terraform_remote_state.landingzone_caf_level1.outputs.log_analytics_workspace.id 
}