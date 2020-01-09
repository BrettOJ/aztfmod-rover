## Azure security center
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    seccenter = {
      passthrough = (var.type == "seccenter" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "seccenter" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "seccenter" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "seccenter" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "seccenter" {
  depends_on = [local.seccenter]
  value = local.seccenter[var.convention]
}