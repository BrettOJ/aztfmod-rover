module "blueprint_vnet_mgmt" {
    source = "../../blueprints/blueprint_vnet_mgmt"
  
    prefix                              = local.prefix
    location                            = var.location_map["region1"]
    log_analytics_workspace             = local.log_analytics_workspace
    diagnostics_map                     = local.diagnostics_map
    tags                                = local.tags
    
    virtual_network_rg                  = var.resource_groups_shared_services["HUB-CORE-NET"]
    resource_groups_shared_services     = var.resource_groups_shared_services
    shared_services_vnet                = var.shared_services_vnet
     
    ddos_name                           = var.ddos_name
    enable_ddos_standard                = var.enable_ddos_standard
    enable_bastion                      = var.enable_bastion
    bastion_config                      = var.bastion_config
}
