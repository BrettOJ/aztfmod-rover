
output "blueprint_vnet_hub" {
  sensitive   = true                      # to hide content from logs
  value       = module.blueprint_vnet_hub
}

output "blueprint_vnet_mgmt" {
  sensitive   = true                      # to hide content from logs
  value       = module.blueprint_vnet_mgmt
}

output "blueprint_vnet_egress" {
  sensitive   = true                      # to hide content from logs
  value       = module.blueprint_vnet_egress
}

output "prefix" {
  value = local.prefix
}

output "tags" {
  value = var.tags
}
