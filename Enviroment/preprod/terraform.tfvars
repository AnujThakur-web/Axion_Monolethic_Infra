resource_groups = {
  rg-1 = {
    name     = "axion-rg"
    location = "centralindia"
  }
}

virtual_networks = {
  vnet = {
    name                = "axion-vnet"
    location            = "centralindia"
    resource_group_name = "axion-rg"

  }
}

subnets = {
  subnets-1 = {
    name                 = "frontend_subnet"
    resource_group_name  = "axion-rg"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnets-2 = {
    name                 = "Backend_subnet"
    resource_group_name  = "axion-rg"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnets-3 = {
    name                 = "DataBase_subnet"
    resource_group_name  = "axion-rg"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }

}
