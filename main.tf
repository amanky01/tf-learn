terraform {
    required_version = ">= 1.8.0"
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=4.1.0"
        }
    }
    backend "azurerm" {}
}

provider "azurerm" {
    features {}
    subscription_id = var.subscription_id
    resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "tf-rg" {
    name     = "rg-terraform"
    location = "East US"
    tags = {
        environment = "dev"
    }
}

resource "azurerm_virtual_network" "tf-vnet" {
    name                = "vnet-terraform"
    resource_group_name = azurerm_resource_group.tf-rg.name
    location            = azurerm_resource_group.tf-rg.location
    address_space       = ["10.123.0.0/16"]
    tags = {
        environment = "dev"
    }
}
