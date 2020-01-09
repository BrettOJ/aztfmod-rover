## eventazurew AD Service Principal
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    cosmosdb = {
      passthrough = (var.type == "cosmosdb" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "cosmosdb" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "cosmosdb" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "cosmosdb" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "cosmosdb" {
  depends_on = [local.cosmosdb]
  value = local.cosmosdb[var.convention]
}