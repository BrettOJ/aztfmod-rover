## Azure Container Registry
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    contregistry = {
      passthrough = (var.type == "contregistry" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "contregistry" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "contregistry" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "contregistry" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "contregistry" {
  depends_on = [local.contregistry]
  value = local.contregistry[var.convention]
}