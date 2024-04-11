terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.0"
    }
  }
}
  backend "azurerm" {
    resource_group_name  = "thu-demo-rg"
    storage_account_name = "sttfstatemgt01"
    container_name       = "tfstate"
    key                  = "demo.terraform.tfstate"
  }

  provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "rav4dbstorage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "blob"
}
