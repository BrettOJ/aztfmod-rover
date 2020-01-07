output "blueprint_virtual_network" {
  sensitive   = true                      # to hide content from logs
  value       = module.blueprint_virtual_network
}

output "prefix" {
  value = local.prefix
}

output "tags" {
  value = var.tags_hub
}
