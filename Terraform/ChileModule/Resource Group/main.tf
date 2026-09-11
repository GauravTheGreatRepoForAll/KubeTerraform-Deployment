resource "azurerm_resource_group" "rg" {
    for_each = var.resource_group
    rg_name = each.value.rg_name
    location = each.value.location
}
