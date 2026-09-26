module "resource_groups" {
    source = "../../Module/azurerm_resource_group"
    resource_groups = var.resource_groups 
  
}

module "virtual_networks" {
    depends_on = [ var.resource_groups ]
    source = "../../Module/azurerm_virtual_network"
    virtual_networks = var.virtual_networks
  
}

module "subnet" {
    depends_on = [ module.resource_groups, module.virtual_networks ]
 source = "../../Module/azurerm_subnet"
 subnets = var.subnets
  
}