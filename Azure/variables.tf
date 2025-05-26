// Variables for shared Azure Infrastructure

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "shared-infrastructure-rg"
}

variable "location" {
  description = "Azure region for resources"
  default     = "westus"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}

// Network variables
variable "vnet_name" {
  description = "Name of the virtual network"
  default     = "shared-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_names" {
  description = "Names of subnets to create"
  type        = list(string)
  default     = ["aks", "shared"]
}

variable "subnet_prefixes" {
  description = "CIDR prefixes for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

// ACR variables
variable "acr_name" {
  description = "Name of the Azure Container Registry"
  default     = "sharedacr"
}

variable "acr_sku" {
  description = "SKU for the Azure Container Registry"
  default     = "Basic"
}

// Key Vault variables
variable "keyvault_name" {
  description = "Name of the Azure Key Vault"
  default     = "shared-keyvault"
}

// AKS variables
variable "aks_name" {
  description = "Name of the Azure Kubernetes Service cluster"
  default     = "shared-aks"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to use"
  default     = "1.25.5"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  default     = "Standard_B2s"
} 