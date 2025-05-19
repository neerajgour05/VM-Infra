RG_Name = {
  "RG_Name1" = {
    name     = "dhondu_RG"
    location = "East US"
  }
}

Storage_Account_Name = {
  Storage_Account_Name1 = {
    name                     = "dhondustg"
    resource_group_name      = "Dhondu_RG"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"

  }
 
}

Vnet_Name = {

  Vnet_Name1 = {
    name                = "DhonduVnet"
    location            = "East US"
    resource_group_name = "Bhondu_RG"
    address_space       = ["10.0.0.0/16"]

  }

}

 Subnet_Name = {
  subnet_name1 = {
    name                 = "DhonduVnet"
    resource_group_name  = "Dhondu_RG"
    virtual_network_name = "DhonduVnet"
    address_prefixes     = ["10.0.0.0/24"]

    }
 }

VM_Name = {
  VM_Name1 = {
    pip_name             = "DhonduPublicIP"
    resource_group_name  = "Dhondu_RG"
     location                 = "East US"
     allocation_method       = "Static"
     nic_name             = "DhonduNIC"
     VM_Name             = "DhonduVM"
     size                = "Standard_F2"
     

  }
}