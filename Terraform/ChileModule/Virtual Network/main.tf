resource "azurerm_virtual_network" "vnet" {

  for_each = var.virtual_network

  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.resource_group

  address_space = each.value.address_space
  dns_servers   = each.value.dns_servers
}


resource "azurerm_subnet" "subnet" {

  for_each = {
    # Flatten the subnets from all virtual networks into a single map with unique keys 
    for subnet in flatten([
      for vnet_key, vnet in var.virtual_network : [
        for subnet in vnet.subnets : {
          key             = "${vnet_key}-${subnet.name}"
          vnet_key        = vnet_key
          subnet_name     = subnet.name
          address_prefixes = subnet.address_prefixes
        }
      ]
    ]) : subnet.key => subnet
  }

  name = each.value.subnet_name

  resource_group_name = azurerm_resource_group.rg[
    var.virtual_network[each.value.vnet_key].resource_group
  ].name

  virtual_network_name = azurerm_virtual_network.vnet[
    each.value.vnet_key
  ].name

  address_prefixes = each.value.address_prefixes
}
