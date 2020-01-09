## eventazurew AD Service Principal
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    frontdoor = {
      passthrough = (var.type == "frontdoor" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "frontdoor" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "frontdoor" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "frontdoor" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "frontdoor" {
  depends_on = [local.frontdoor]
  value = local.frontdoor[var.convention]
}