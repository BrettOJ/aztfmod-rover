
data "azurerm_client_config" "current" {
}

provider "azurerm" {
  version = "<= 1.37"
}

provider "azuread" {
    version = "<=0.6.0"
}


data "azurerm_subscription" "current" {
}

locals {
  blueprint_tag          = {
    "blueprint" = basename(abspath(path.module))
  }
  tags                = merge(var.tags_hub,local.blueprint_tag)
}