variable "resource_groups" {
  description = "(Required) Contains the resource groups object to be created for vdc_level1"
}

# Example:
# resource_groups = {
#     apim          = { 
#                     name     = "-apim-demo"
#                     location = "southeastasia" 
#     },
#     networking    = {    
#                     name     = "-networking-demo"
#                     location = "eastasia" 
#     },
#     insights      = { 
#                     name     = "-insights-demo"
#                     location = "francecentral" 
#                     tags     = {
#                       project     = "Pattaya"
#                       approver     = "Gunter"
#                     }   
#     },
# }

variable "location_map" {
  description = "(Required) Default location to create the resources"
  type        = map(string)
}

variable "tags" {
  description = "(Required) Map of the tags to be applied"
  type    = map(string)
}
variable "appname" {
  
}
variable "env" {
  
}
variable "node_resource_group" {
  
}
variable "admin_username" {
  
}