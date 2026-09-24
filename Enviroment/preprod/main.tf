module "resource_groups" {
  source          = "../../Module/azurerm_resource_group"
  resource_groups = var.resource_groups

}

module "virtual_networks" {
  depends_on       = [module.resource_groups]
  source           = "../../Module/azurerm_virtual_network"
  virtual_networks = var.virtual_networks

}

module "subnet" {
  depends_on = [module.resource_groups, module.virtual_networks]
  source     = "../../Module/azurerm_subnet"
  subnets    = var.subnets

}

module "pip" {
  depends_on = [module.virtual_networks ]
  source     = "../../Module/azurerm_public_ip_address"
  pips       = var.public_ip

}

module "nic" {
  depends_on = [module.subnet]
  source     = "../../Module/azurerm_network_interface_card"
  nics       = var.nic_prod
}

module "nsg" {
  depends_on = [module.nic]
  source     = "../../Module/azurerm_network_security_group"
  nsgs       = var.nic_prod
}

module "vm" {
  depends_on = [ module.resource_groups, module.nic ]
  source = "../../Module/azurerm_virtual_machine"
  vms    = var.vm_prod

}

module "postressqldatabase" {
  depends_on = [ module.resource_groups ]
  source = "../../Module/azurerm_postgresql"
  postgresdb = var.postsqldb_prod
  
}