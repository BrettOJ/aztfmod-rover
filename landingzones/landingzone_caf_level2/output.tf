

output "prefix" {
  value = local.prefix
  description = "prefix from level0"
}

output "tags" {
  value = var.tags_hub
  description = "default tags for the objects in foundations blueprint"
}
