module "Resource_Group" {
  source         = "../../Modules/Resource_Group"
  RG_Name_module = var.RG_Name
}

module "Storage_Account" {
  depends_on                  = [module.Resource_Group]
  source                      = "../../Modules/Storage_Account"
  Storage_Account_Name_Module = var.Storage_Account_Name
}


module "Vnet" {
  depends_on = [module.Resource_Group]
  source           = "../../Modules/Vnet"
  Vnet_Name_Module = var.Vnet_Name

}

module "Subnet" {
  depends_on         = [module.Vnet]
  source            = "../../Modules/Subnet"
  Subnet_Name_Module = var.Subnet_Name
}

module "VM" {
  depends_on = [module.Subnet]
  source        = "../../Modules/VM"
  VM_Name_Module = var.VM_Name


}