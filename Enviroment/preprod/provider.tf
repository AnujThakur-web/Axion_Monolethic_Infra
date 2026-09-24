terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "infra-rg"
    storage_account_name = "infrastatestorage1407"
    container_name       = "tfstate"
    key                  = "preprod_terraform.tfstate"
  }


}

provider "azurerm" {
  features {}
  subscription_id = "515776c8-b3a8-4862-9224-9442d9a6ebb9"
}









  


