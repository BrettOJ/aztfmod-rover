## Azure DNS
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    dns = {
      passthrough = (var.type == "dns" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "dns" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "dns" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "dns" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "dns" {
  depends_on = [local.dns]
  value = local.dns[var.convention]
}