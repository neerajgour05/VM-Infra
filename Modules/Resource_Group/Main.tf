resource "azurerm_resource_group" "RG_Name_module" {
    for_each = var.RG_Name_module
    name    = each.value.name
    location = each.value.location
}