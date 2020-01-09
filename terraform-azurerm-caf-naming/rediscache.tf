## Azure Redis Cache
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    rediscache = {
      passthrough = (var.type == "rediscache" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "rediscache" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "rediscache" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "rediscache" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "rediscache" {
  depends_on = [local.rediscache]
  value = local.rediscache[var.convention]
}