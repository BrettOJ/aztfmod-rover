## Azure Container Group
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    contgroup = {
      passthrough = (var.type == "contgroup" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "contgroup" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "contgroup" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "contgroup" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "contgroup" {
  depends_on = [local.contgroup]
  value = local.contgroup[var.convention]
}