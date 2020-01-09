## eventhub
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    appgw = {
      passthrough = (var.type == "appgw" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "appgw" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "appgw" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "appgw" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "appgw" {
  depends_on = [local.appgw]
  value = local.appgw[var.convention]
}