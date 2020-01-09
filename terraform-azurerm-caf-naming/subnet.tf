## virtual Network
locals {
  # Alphanumeric, period, hyphen, underscore.
    subnet = {
      passthrough = (var.type == "subnet" && var.convention == "passthrough") ? substr(local.filtered.alphanumhup, 0, local.max) : null
      cafclassic  = (var.type == "subnet" && var.convention == "cafclassic") ? substr("${local.filtered.alphanumhup}-${local.filteredpostfix.alphanumhup}", 0, local.max) : null 
      cafrandom   = (var.type == "subnet" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhup}-${local.filteredpostfix.alphanumhup}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "subnet" && var.convention == "random") ? substr("${lookup(var.caf_prefix, var.type)}${local.fullyrandom}", 0, local.max) : null 
    }
}
output "subnet" {
  depends_on = [local.subnet]
  value = local.subnet[var.convention]
}