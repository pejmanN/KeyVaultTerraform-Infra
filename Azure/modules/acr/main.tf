// Azure Container Registry Module

// Variables
variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region for resources"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
}

variable "sku" {
  description = "SKU for the Azure Container Registry"
  default     = "Basic"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

// Create Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false
  tags                = var.tags
  
  // Add lifecycle block to prevent recreation on certain changes
  lifecycle {
    ignore_changes = [
      tags["LastDeployed"]
    ]
  }
}

// Outputs
output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
} 