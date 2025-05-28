variable "storage_account_name" {
  description = "Name of the storage account for Terraform state"
  type        = string
}

variable "container_name" {
  description = "Name of the blob container for Terraform state"
  type        = string
  default     = "tfstate"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
} 