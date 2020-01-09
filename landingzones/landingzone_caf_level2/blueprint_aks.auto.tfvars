
# Set of resource groupds to land the blueprint
resource_groups = {
    HUB-CORE-AKS    = {
        name = "-hub-core-aks"
        location = "southeastasia"
    }
}

#Primary location picked is region1, region2 is picked as backup whenever applicable
location_map = {
    region1   = "southeastasia"
    region2   = "eastasia"
}

#Set of tags for core operations: includes core resources for hub
tags = {
    environment     = "DEV"
    owner           = "Avanade"
    deploymentType  = "Terraform"
    costCenter      = "1664"
    BusinessUnit    = "SHARED"
    DR              = "NON-DR-ENABLED"
}

 log_analytics_workspace_id = local.log_analytics_workspace_id
