## Azure web app container
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    webappcont = {
      passthrough = (var.type == "webappcont" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "webappcont" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "webappcont" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "webappcont" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "webappcont" {
  depends_on = [local.webappcont]
  value = local.webappcont[var.convention]
}