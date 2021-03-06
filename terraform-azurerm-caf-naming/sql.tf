## Azure SQL
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    sql = {
      passthrough = (var.type == "sql" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "sql" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "sql" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "sql" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "sql" {
  depends_on = [local.sql]
  value = local.sql[var.convention]
}