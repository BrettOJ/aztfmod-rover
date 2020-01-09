
data "azurerm_client_config" "current" {
}

provider "azurerm" {
  version = "<= 1.37"
}

provider "azuread" {
    version = "<=0.6.0"
}

terraform {
    backend "azurerm" {
    }
}

locals {
  blueprint_tag          = {
    "blueprint" = basename(abspath(path.module))
  }
  tags                = merge(var.tags,local.blueprint_tag)
  HUB-CORE-VNET = lookup(module.resource_group.names, "HUB-CORE-VNET", null)
}