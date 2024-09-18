# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.loc
}

resource "azurerm_virtual_network" "network" {
  name                = var.vn_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vn_address_space
 #dns_servers         = ["10.0.0.4", "10.0.0.5"]

/*
subnet {
    name             = "subnet1"
    address_prefix = "10.0.1.0/24"
  }*/
}

# this is now an "input" value 
variable "loc" {
  type    = string
  default = "eastus2"
}

variable "rg_name" {
  type = string
  default = "TanksTinyRG"
}

variable "vn_name" {
  type    = string
  default = "superFastNetwork"
}

variable "vn_address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]
}
