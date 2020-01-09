##Azure Network Secuirty Group
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    nsg = {
      passthrough = (var.type == "nsg" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "nsg" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "nsg" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "nsg" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "nsg" {
  depends_on = [local.nsg]
  value = local.nsg[var.convention]
}