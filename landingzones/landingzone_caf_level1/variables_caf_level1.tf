variable "resource_groups_hub" {
  description = "(Required) Contains the resource groups object to be created for vdc_level1"
}


variable "location_map" {
  description = "(Required) Default location to create the resources"
  type        = map(string)
}

variable "tags_hub" {
  description = "(Required) Map of the tags to be applied"
  type    = map(string)
}

variable "prefix" {
  description = "(Optional) Prefix to uniquely identify the deployment"  
}

variable "enable_network_watcher" {
  description = "Enable network watcher for the subnet - this will deploy and configure a Linux VM with network watcher extensions."
  default = false
}

variable "log_analytics_workspace" {
  
}

variable "diagnostics_map" {
  
}



