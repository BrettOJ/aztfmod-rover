## virtual Network
locals {
  # Alphanumeric, period, hyphen, underscore.
    vm = {
      passthrough = (var.type == "vm" && var.convention == "passthrough") ? substr(local.filtered.alphanumhup, 0, local.max) : null
      cafclassic  = (var.type == "vm" && var.convention == "cafclassic") ? substr("${local.filtered.alphanumhup}-${local.filteredpostfix.alphanumhup}", 0, local.max) : null 
      cafrandom   = (var.type == "vm" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}-${local.filteredpostfix.alphanumhup}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "vm" && var.convention == "random") ? substr("${lookup(var.caf_prefix, var.type)}${local.fullyrandom}", 0, local.max) : null 
    }
}
output "vm" {
  depends_on = [local.vm]
  value = local.vm[var.convention]
}