module "blueprint_vnet_hub" {
    source = "../../blueprints/blueprint_vnet_hub"
  
    prefix                              = local.prefix
    location                            = var.location_map["region1"]
    log_analytics_workspace             = local.log_analytics_workspace
    diagnostics_map                     = local.diagnostics_map
    tags                                = local.tags

    ip_addr_config                      = var.public_ip_addr
    remote_network                      = var.remote_network
    connection_name                     = var.connection_name
    resource_groups_shared_transit      = var.resource_groups_shared_transit
    networking_object                   = var.networking_transit
    networking_transit                  = var.networking_transit
    remote_network_connect              = var.remote_network_connect
    gateway_config                      = var.gateway_config
    provision_gateway                   = var.provision_gateway
    

    shared_services_vnet_object         = module.blueprint_vnet_mgmt.shared_services_vnet_object
    virtual_network_rg                  = module.blueprint_vnet_mgmt.resource_group_shared_services

    akv_config                          = var.akv_config
}
