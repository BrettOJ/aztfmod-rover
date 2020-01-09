## App Service Container for Linux
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    ascl = {
      passthrough = (var.type == "ascl" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "ascl" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "ascl" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "ascl" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "ascl" {
  depends_on = [local.ascl]
  value = local.ascl[var.convention]
}