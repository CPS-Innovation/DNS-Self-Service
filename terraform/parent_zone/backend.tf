terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.63.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = "cps-internal-dns.tfstate"
  }
}

provider "azurerm" {
  features {}
}