## Azure AKS
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    aks = {
      passthrough = (var.type == "aks" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "aks" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "aks" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "aks" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "aks" {
  depends_on = [local.aks]
  value = local.aks[var.convention]
}