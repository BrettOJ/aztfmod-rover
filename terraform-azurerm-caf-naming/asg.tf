## application security group
locals {
  # Alphanumeric, period, hyphen, underscore. Must start and end with a letter or number.
    asg = {
      passthrough = (var.type == "asg" && var.convention == "passthrough") ? substr(local.filtered.alphanumhu, 0, local.max) : null
      cafclassic  = (var.type == "asg" && var.convention == "cafclassic") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}", 0, local.max) : null
      cafrandom   = (var.type == "asg" && var.convention == "cafrandom") ? substr("${lookup(var.caf_prefix, var.type)}${local.filtered.alphanumhu}-${local.filteredpostfix.alphanumhu}-${local.fullyrandom}", 0, local.max) : null 
      random      = (var.type == "asg" && var.convention == "random") ? substr(local.fullyrandom, 0, local.max) : null
    }
 }
output "asg" {
  depends_on = [local.asg]
  value = local.asg[var.convention]
}