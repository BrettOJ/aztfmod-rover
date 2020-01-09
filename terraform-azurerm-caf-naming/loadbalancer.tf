## eventazurew AD Service Principal
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    loadbalancer = {
      passthrough = (var.type == "loadbalancer" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "loadbalancer" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "loadbalancer" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "loadbalancer" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "loadbalancer" {
  depends_on = [local.loadbalancer]
  value = local.loadbalancer[var.convention]
}