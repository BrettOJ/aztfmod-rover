# Set of resource groupds to land the blueprint
resource_groups_hub = {
    HUB-CORE-SEC    = {
        name = "-hub-core-sec"
        location = "southeastasia"
    }
}
#Set of tags for core operations: includes core resources for hub
tags_hub = {
    environment     = "DEV"
    owner           = "Avanade"
    deploymentType  = "Terraform"
    costCenter      = "1664"
    BusinessUnit    = "SHARED"
    DR              = "NON-DR-ENABLED"
}

