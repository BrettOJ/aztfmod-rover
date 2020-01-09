## App Services Plan for Linux
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    apspl = {
      passthrough = (var.type == "apspl" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "apspl" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "apspl" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "apspl" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "apspl" {
  depends_on = [local.apspl]
  value = local.apspl[var.convention]
}