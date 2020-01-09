

output "blueprint_aks_cluster" {
  sensitive   = true                      # to hide content from logs
  value       = module.blueprint_aks_cluster
}

output "prefix" {
  value = local.prefix
  description = "prefix from level0"
}

output "tags" {
  value = var.tags
  description = "default tags for the objects in foundations blueprint"
}
