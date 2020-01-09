
module "caf_name_apim" {
  source = "../terraform-azurerm-caf-naming/"

  name    = var.name
  type    = "apim"
  convention  = var.convention
}

resource "azurerm_api_management" "api_management" {
  name                = module.caf_name_apim.apim
  resource_group_name = var.resource_group_name
  location            = var.location
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  tags                = var.tags
  sku_name            = var.sku_name

}
