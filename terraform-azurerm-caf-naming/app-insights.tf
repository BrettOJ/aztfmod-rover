## Azur Application Insights
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    appinsights = {
      passthrough = (var.type == "appinsights" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "appinsights" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "appinsights" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "appinsights" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "appinsights" {
  depends_on = [local.appinsights]
  value = local.appinsights[var.convention]
}