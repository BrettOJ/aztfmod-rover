module "blueprint_aks_cluster" {
    source                              = "../../blueprints/blueprint_aks_cluster"

    prefix                              = local.prefix

    location                            = var.location_map["region1"]
    resource_groups                     = var.resource_groups
    tags                                = var.tags
    app_name                            = var.appname
    env                                 = var.env
    node_resource_group                 = var.node_resource_group  
    admin_username                      = var.admin_username
}

