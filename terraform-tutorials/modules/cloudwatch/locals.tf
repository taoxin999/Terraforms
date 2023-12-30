locals {
  sid_prefix = replace(title(var.name_prefix), "-", "")
}
