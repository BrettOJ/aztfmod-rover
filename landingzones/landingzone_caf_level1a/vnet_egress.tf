
module "blueprint_vnet_egress" {
    source = "../../blueprints/blueprint_vnet_egress"
  
    prefix                              = local.prefix
    location                            = var.location_map["region1"]
    log_analytics_workspace             = local.log_analytics_workspace
    diagnostics_map                     = local.diagnostics_map
    tags                                = local.tags
    
    resource_groups_shared_egress       = var.resource_groups_shared_egress

    networking_object                   = var.networking_egress
    ip_addr_config                      = var.ip_addr_config
    az_fw_config                        = var.az_fw_config
    udr_object                          = var.udr_object
    
    shared_services_vnet_object         = module.blueprint_vnet_mgmt.shared_services_vnet_object
    virtual_network_rg                  = module.blueprint_vnet_mgmt.resource_group_shared_services
}