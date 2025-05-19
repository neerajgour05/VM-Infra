
data "azurerm_subnet" "data_subnet" {
  name                 = "DhonduVnet"
  virtual_network_name = "DhonduVnet"
  resource_group_name  = "Dhondu_RG"
}


resource "azurerm_public_ip" "pip" {
    for_each = var.VM_Name_Module   
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

}


resource "azurerm_network_interface" "nic" {
    for_each = var.VM_Name_Module
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet.id
     private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "VM" {
    for_each = var.VM_Name_Module
  name                = each.value.VM_Name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = "adminuser"
  admin_password      =  "Password@1234"
  disable_password_authentication = false   
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

 
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}