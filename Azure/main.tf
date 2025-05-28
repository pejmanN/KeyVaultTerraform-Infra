// Main Terraform configuration for shared Azure Infrastructure

// Azure Provider Configuration
provider "azurerm" {
  features {}
}

// Configure Terraform backend (for production, use Azure Storage)
terraform {
  backend "azurerm" {
    # These values must be provided via command line or environment variables
    # resource_group_name  = "rg-terraform-state"
    # storage_account_name = "terraformstate12345"
    # container_name       = "tfstate"
    # key                  = "azure-infra.tfstate"
  }
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

// Create Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

// Storage for Remote State
module "storage" {
  source              = "./modules/storage"
  storage_account_name = var.storage_account_name
  container_name      = var.container_name
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  tags                = var.tags
}

// Import modules
module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  subnet_names        = var.subnet_names
  subnet_prefixes     = var.subnet_prefixes
  tags                = var.tags
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  acr_name            = var.acr_name
  sku                 = var.acr_sku
  tags                = var.tags
}

module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  keyvault_name       = var.keyvault_name
  tags                = var.tags
}

module "aks" {
  source                = "./modules/aks"
  resource_group_name   = azurerm_resource_group.main.name
  location              = var.location
  aks_name              = var.aks_name
  kubernetes_version    = var.kubernetes_version
  node_count            = var.node_count
  vm_size               = var.vm_size
  vnet_subnet_id        = module.network.subnet_ids["aks"]
  acr_id                = module.acr.acr_id
  tags                  = var.tags
} 