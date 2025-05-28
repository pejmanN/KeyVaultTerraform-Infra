// Outputs for shared Azure Infrastructure

// Resource Group outputs
output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "resource_group_id" {
  value = azurerm_resource_group.main.id
}

output "location" {
  value = var.location
}

// Storage outputs for remote state
output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "storage_container_name" {
  value = module.storage.container_name
}

output "storage_account_id" {
  value = module.storage.storage_account_id
}

// Network outputs
output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

// ACR outputs
output "acr_id" {
  value = module.acr.acr_id
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

// Key Vault outputs
output "keyvault_id" {
  value = module.keyvault.keyvault_id
}

output "keyvault_url" {
  value = module.keyvault.keyvault_url
}

// AKS outputs
output "aks_id" {
  value = module.aks.aks_id
}

output "aks_name" {
  value = module.aks.aks_name
}

output "aks_host" {
  value     = module.aks.host
  sensitive = true
}

output "aks_client_certificate" {
  value     = module.aks.client_certificate
  sensitive = true
}

output "aks_client_key" {
  value     = module.aks.client_key
  sensitive = true
}

output "aks_cluster_ca_certificate" {
  value     = module.aks.cluster_ca_certificate
  sensitive = true
}

output "aks_kube_config" {
  value     = module.aks.kube_config_raw
  sensitive = true
}

output "aks_oidc_issuer_url" {
  value = module.aks.oidc_issuer_url
} 