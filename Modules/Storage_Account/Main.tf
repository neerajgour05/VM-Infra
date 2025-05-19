resource "azurerm_storage_account" "Storage_Account_Name_module" {
    for_each = var.Storage_Account_Name_Module
    
    name                     = each.value.name
    resource_group_name      = each.value.resource_group_name
    location                 = each.value.location
    account_tier             = each.value.account_tier
    account_replication_type = each.value.account_replication_type
    

}