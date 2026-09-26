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
    name                 = "Frontend_subnet"
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

public_ip = {
  pip-1 = {
    name                = "Frontend_pip"
    resource_group_name = "axion-rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }

  pip-2 = {
    name                = "Backend_pip"
    resource_group_name = "axion-rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }

  pip-3 = {
    name                = "DataBase_pip"
    resource_group_name = "axion-rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

nic_prod = {
  nic-1 = {
    name                          = "Frontend_nic"
    location                      = "centralindia"
    resource_group_name           = "axion-rg"
    nic_name                      = "internal"
    private_ip_address_allocation = "Dynamic"
    nic_data_subnet_name          = "Frontend_subnet"
    virtual_network_name          = "axion-vnet"
    public_ip_name                = "Frontend_pip"
  }

  nic-2 = {
    name                          = "Backend_nic"
    location                      = "centralindia"
    resource_group_name           = "axion-rg"
    nic_name                      = "internal"
    private_ip_address_allocation = "Dynamic"
    nic_data_subnet_name          = "Backend_subnet"
    virtual_network_name          = "axion-vnet"
    public_ip_name                = "Backend_pip"
  }

  nic-3 = {
    name                          = "database_nic"
    location                      = "centralindia"
    resource_group_name           = "axion-rg"
    nic_name                      = "internal"
    private_ip_address_allocation = "Dynamic"
    nic_data_subnet_name          = "DataBase_subnet"
    virtual_network_name          = "axion-vnet"
    public_ip_name                = "DataBase_pip"
  }
}

nsg_prod = {
  nsg-1 = {
    name                = "Frontend_nsg"
    location            = "centralindia"
    resource_group_name = "axion-rg"
  }

  nsg-2 = {
    name                = "Backend_nsg"
    location            = "centralindia"
    resource_group_name = "axion-rg"
  }

  nsg-3 = {
    name                = "DataBase_nsg"
    location            = "centralindia"
    resource_group_name = "axion-rg"
  }
}

vm_prod = {
  vm-1 = {
    name                            = "Frontend-vm"
    resource_group_name             = "axion-rg"
    location                        = "centralindia"
    size                            = "Standard_F2"
    admin_username                  = "adminuser"
    admin_password                  = "Password@123"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    nic_name                        = "Frontend_nic"
  }

  vm-2 = {
    name                            = "Backend-vm"
    resource_group_name             = "axion-rg"
    location                        = "centralindia"
    size                            = "Standard_F2"
    admin_username                  = "adminuser"
    admin_password                  = "Password@123"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    nic_name                        = "Backend_nic"
  }

  vm-3 = {
    name                            = "DataBase-vm"
    resource_group_name             = "axion-rg"
    location                        = "centralindia"
    size                            = "Standard_F2"
    admin_username                  = "adminuser"
    admin_password                  = "Password@123"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    nic_name                        = "DataBase_nic"
  }
}

postsqldb_prod = {
  DataBase = {
    name                   = "postgressql-db"
    resource_group_name    = "axion-rg"
    location               = "centralindia"
    administrator_login    = "useradmin"
    administrator_password = "Password@123"
    storage_mb             = 32768
    version                = "12"
    sku_name               = "GP_Standard_D4s_v3"
    zone                   = "2"
  }
}