variable "prefix" {
  description = "(Optional) Prefix to uniquely identify the deployment"  
}

variable "virtual_network_rg" {
  description = "(Required) Map of the resource groups to create"
}

variable "location" {
  description = "(Required) Define the region where the resource groups will be created"
}

variable "tags" {
  description = "tags for the deployment"
}

variable "enable_network_watcher" {
  description = "Enable network watcher for the subnet - this will deploy and configure a Linux VM with network watcher extensions."
  default = false
}

variable "log_analytics_workspace" {
  
}

variable "diagnostics_map" {
  
}


