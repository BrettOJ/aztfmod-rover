module "blueprint_virtual_network" {
    source                             = "../../blueprints/blueprint_virtual_network"
    
    prefix                             = var.prefix
    location                           = var.location_map["region1"]
    resource_groups_hub                 = var.resource_groups_hub
    tags_hub                           = var.tags_hub
    networking_object                  = var.main_vnet
    diagnostics_map                    = local.diagnostics_map
    log_analytics_workspace            = local.log_analytics_workspace

}
