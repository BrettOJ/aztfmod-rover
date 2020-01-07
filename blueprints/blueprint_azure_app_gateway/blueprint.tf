#Create the resource groups to host the blueprint
module "resource_group_hub" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
  prefix          = var.prefix
  resource_groups = var.resource_groups_hub
  tags            = local.tags
}
/*
module "public_ip_address" {
    source  = "aztfmod/caf-public-ip/azurerm"
    version = "0.1.0"

    name                              = var.name
    location                          = var.location
    rg                                = module.resource_group_hub.names["HUB-CORE-SEC"]
    ip_addr                           = var.ipconfig
    diagnostics_settings              = var.ipdiags
    diagnostics_map                   = var.diagsmap
    la_workspace_id                   = var.laworkspace.id
}
*/
module "virtual_network" {
    source  = "aztfmod/caf-virtual-network/azurerm"
    version = "0.1.0"

    virtual_network_rg                = module.resource_group_hub.names["HUB-CORE-SEC"]
    prefix                            = var.prefix
    location                          = var.location
    networking_object                 = var.shared_services_vnet
    tags                              = var.tags
    diagnostics_map                   = var.diagnostics_map
    log_analytics_workspace           = var.log_analytics_workspace
}
/*
module "azurerm_application_gateway" {
  source = "../../modules/"

    rg                  = module.resource_group_hub.names["HUB-CORE-SEC"]
    location            = var.location
    waf_configuration   = var.waf_configuration
    app_gw              = var.app_gw
    env                 = var.coreservices_env
    subnet_id           = module.virtual_network.vnet_subnets["snet-web-dmz"]
    resource_group_name = local.coreservices_rg
    be_fqdns            = [module.app_service_webportal.default_site_hostname] 
    fe_publicip         = module.waf_publicip.public_ip_address_id
    tags                = local.coreservices_tags

}
*/
