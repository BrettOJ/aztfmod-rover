
output "location" {
  value = var.location
  description = "exports the location where objects from foundation have been created"
}

output "tags" {
  value = var.tags_hub
  description = "exports the tags created in this blueprint"
}

output "prefix" {
  value = var.prefix
  description = "exports the prefix as generated in level0"
}