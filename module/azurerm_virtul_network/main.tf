resource "azurerm_virtual_network" "example" {
  for_each            = var.vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  dynamic "subnet" {
    for_each = each.value.subnet
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }

  }

  #   subnet {
  #     name             = "subnet2"
  #     address_prefixes = ["10.0.2.0/24"]
  #     security_group   = azurerm_network_security_group.example.id
  #   }
}
