module "blueprint_virtual_network" {
    source                             = "../../blueprints/blueprint_virtual_network"
    
    prefix                             = var.prefix
    location                           = var.location_map["region1"]
    tags                               = var.tags
    resource_groups                    = var.resource_groups
    main_vnet                          = var.main_vnet
    diagnostics_map                    = local.diagnostics_map
    log_analytics_workspace            = local.log_analytics_workspace
    diagnostics_settings               = var.main_vnet.diagnostics
}
