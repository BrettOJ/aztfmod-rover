#Cloud Adoption Framework Landing Zone level 1

# Set of resource groupds to land the blueprint
resource_group_hub = {
    HUB-CORE-VNET    = {
        name = "-hub-core-vnet"
        location = "southeastasia"
    }

}

#Primary location picked is region1, region2 is picked as backup whenever applicable
location_map = {
    region1   = "southeastasia"
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

main_vnet = {
        vnet = {
            name                = "sg1-vnet-dmz"
            address_space       = ["10.101.4.0/22"]     # 10.100.4.0 - 10.100.7.255
            dns                 = ["192.168.0.16", "192.168.0.64"]
            enable_ddos_std     = true
            ddos_id             = "/subscriptions/00000000-0000-0000-0000-0000000000000/resourceGroups/testrg/providers/Microsoft.Network/ddosProtectionPlans/myddos"

        }
        specialsubnets     = {
                AzureFirewallSubnet = {
                name                = "AzureFirewallSubnet"
                cidr                = "10.101.4.0/25"
               }
            }
        subnets = {
            Subnet_1        = {
                name                = "Active_Directory"
                cidr                = "10.101.4.128/27"
                service_endpoints   = []
                nsg_inbound         = [
                    # {"Name", "Priority", "Direction", "Action", "Protocol", "source_port_range", "destination_port_range", "source_address_prefix", "destination_address_prefix" }, 
                    ["LDAP-t", "100", "Inbound", "Allow", "*", "*", "389", "*", "*"],
                    ["RPC-EPM", "102", "Inbound", "Allow", "tcp", "*", "135", "*", "*"],
                    ["SMB-In", "103", "Inbound", "Allow", "tcp", "*", "445", "*", "*"],
                ]
                nsg_outbound        = []
                delegation          = {
                    name = "acctestdelegation1" 
                    service_delegation = {
                    name    = "Microsoft.ContainerInstance/containerGroups"
                    actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
                    }
                }
            }

        }
}

##Log analytics solutions to be deployed 
solution_plan_map = {
    NetworkMonitoring = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/NetworkMonitoring"

    }
}
log_analytics_workspace = ""
