## Azure API Manager
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    apim = {
      passthrough = (var.type == "apim" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "apim" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "apim" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "apim" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "apim" {
  depends_on = [local.apim]
  value = local.apim[var.convention]
}