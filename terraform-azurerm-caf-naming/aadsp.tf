## eventazurew AD Service Principal
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    aadsp = {
      passthrough = (var.type == "aadsp" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "aadsp" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "aadsp" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "aadsp" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "aadsp" {
  depends_on = [local.aadsp]
  value = local.aadsp[var.convention]
}