module "blueprint_virtual_network" {
    source                             = "../../blueprints/blueprint_virtual_network"
    
    prefix                             = var.prefix
    location                           = var.location_map["region1"]
    resource_group_hub                 = var.resource_group_hub
    tags_hub                           = var.tags_hub
    networking_object                  = var.main_vnet
    diagnostics_map                    = var.diagnostics_map
    log_analytics_workspace            = var.log_analytics_workspace

}
