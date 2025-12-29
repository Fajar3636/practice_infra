resource "azurerm_resource_group" "dev_rg1" {
  for_each = var.rg
  name     = each.value.name
  location = each.value.location
}

